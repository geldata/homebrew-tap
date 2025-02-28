#!/usr/bin/env python3
from __future__ import annotations
from typing import (
    TYPE_CHECKING,
    Any,
    NoReturn,
    TypedDict,
)

import json
import functools
import pathlib
import sys
import urllib.parse
import urllib.request

import jinja2
import semver


if TYPE_CHECKING:
    Version = str
    RemoteFilePath = str


class Prerelease(TypedDict):
    phase: str
    number: int


class Version(TypedDict):
    major: int
    minor: int | None
    patch: int | None
    prerelease: list[Prerelease]
    metadata: dict[str, str]


def version_to_str(v: Version) -> str:
    result = str(v["major"])
    if v["minor"] is not None:
        result += f".{v['minor']}"
    if v["patch"] is not None:
        result += f".{v['patch']}"
    if v["prerelease"]:
        result += "-" + ".".join(
            f"{p['phase']}.{p['number']}" for p in v["prerelease"])

    return result


class InstallRef(TypedDict):
    ref: str
    type: str | None
    encoding: str | None
    verification: dict[str, str | int]


class Package(TypedDict):
    basename: str  # gel-server
    slot: str | None  # 1-alpha6-dev5069
    name: str  # gel-server-1-alpha6-dev5069
    version: str  # 1.0a6.dev5069+g0839d6e8
    version_details: Version
    version_key: str  # 1.0.0~alpha.6~dev.5069.2020091300~nightly
    architecture: str  # x86_64
    revision: str  # 2020091300~nightly
    installrefs: list[InstallRef]
    installref: str


INDEX_URL = "https://packages.geldata.com/archive/.jsonindexes"
CURRENT_DIR = pathlib.Path(__file__).parent
VERSION_BLOCKLIST = {"1.0a3"}


jinja_env = jinja2.Environment(loader=jinja2.FileSystemLoader(CURRENT_DIR))


def die(msg: str) -> NoReturn:
    print(msg, file=sys.stderr)
    sys.exit(1)


def query_latest_version(index: str) -> Package:
    with urllib.request.urlopen(f"{INDEX_URL}/{index}.json") as url:
        indexes = json.load(url)
    versions: dict[Version, Package] = {}
    for package in indexes["packages"]:
        if not package["name"] == "gel-cli":
            continue
        if package["version"] in VERSION_BLOCKLIST:
            continue
        versions[package["version"]] = package
    latest_version = sorted(
        versions,
        key=functools.cmp_to_key(semver.compare),
        reverse=True,
    )[0]
    return versions[latest_version]


def get_tpl_data(channel: str) -> dict[str, Any]:
    targets = [
        "x86_64-apple-darwin",
        "aarch64-apple-darwin",
        "x86_64-unknown-linux-musl",
        "aarch64-unknown-linux-musl",
    ]

    suffix = "" if channel == "release" else f".{channel}"

    packages = {
        target: query_latest_version(target + suffix)
        for target in targets
    }

    print(packages)

    versions = {
        version_to_str(v["version_details"])
        for v in packages.values()
    }
    if len(versions) > 1:
        die(f"target versions don't match: {', '.join(sorted(versions))}")

    artifacts = {}
    for target, package in packages.items():
        for installref in package["installrefs"]:
            if installref["encoding"] == "identity":
                url = "https://packages.geldata.com" + installref["ref"]
                parsed = urllib.parse.urlparse(url)
                artifacts[target] = {
                    "url": url,
                    "file": parsed.path.split('/')[-1],
                    "sha256": installref["verification"]["sha256"],
                }

    return {
        "name": "gel",
        "marketing_name": "Gel",
        "version": next(iter(versions)),
        "artifacts": artifacts,
        "channel": channel,
    }


def render_formula(path: pathlib.Path, channel: str) -> None:
    tplfile = CURRENT_DIR / "Formula.rb.tpl"
    if not tplfile.exists():
        die(f'template does not exist: {tplfile}')

    with open(tplfile) as f:
        tpl = jinja_env.from_string(f.read())

    output = tpl.render(get_tpl_data(channel))

    with path.open("w") as target:
        print(output, file=target)


def main() -> None:
    release_cli = CURRENT_DIR / "Formula" / "gel-cli.rb"
    testing_cli = CURRENT_DIR / "Formula" / "gel-cli-testing.rb"
    nightly_cli = CURRENT_DIR / "Formula" / "gel-cli-nightly.rb"
    render_formula(release_cli, channel="release")
    render_formula(testing_cli, channel="testing")
    render_formula(nightly_cli, channel="nightly")


if __name__ == "__main__":
    main()
