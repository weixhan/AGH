"""Run the official AGH entry with an isolated project home and profile."""
from __future__ import annotations

import argparse
import os
from pathlib import Path
import shutil
import subprocess
import sys


def main(argv: list[str] | None = None) -> int:
    root = Path(__file__).resolve().parent
    # AGH owns --help and all task/subcommand flags. Only consume the two
    # launcher options, without treating AGH flags as option abbreviations.
    parser = argparse.ArgumentParser(description=__doc__, add_help=False, allow_abbrev=False)
    parser.add_argument("--entry", type=Path, default=root.parent / "agnes-harness" / "packages" / "cli" / "dist" / "local" / "agnes.mjs")
    parser.add_argument("--node", default=shutil.which("node"))
    args, forwarded = parser.parse_known_args(argv)
    if forwarded[:1] == ["--"]:
        forwarded = forwarded[1:]
    if not args.node or not args.entry.is_file():
        print("AGH runtime is not ready. Build Agnes Harness before starting this launcher.", file=sys.stderr)
        return 2
    home = root / ".runtime" / "agh"
    home.parent.mkdir(parents=True, exist_ok=True)
    if not home.exists():
        if os.name == "nt":
            initialize_private_home = (
                "const {createRequire}=require('node:module');"
                "const {toNamespacedPath}=require('node:path');"
                "const native=createRequire(process.argv[1])('@agnes/system-node/native');"
                "const home=toNamespacedPath(process.argv[2]);"
                "native.createPrivateDirectory(home);"
                "if(!native.hasPrivateDacl(home))throw new Error('AGH private home validation failed');"
            )
            initialized = subprocess.run(
                [args.node, "-e", initialize_private_home, str(args.entry.resolve()), str(home)],
                check=False,
            )
            if initialized.returncode:
                return initialized.returncode
        else:
            home.mkdir(mode=0o700)
    environment = dict(os.environ)
    # This AGH build resolves profile names through its built-in templates.
    # Keep the supported local-dev template inside this project's private home.
    environment.update({"AGH_HOME": str(home), "AGNES_PROFILE": "local-dev", "PYTHONUTF8": "1"})
    environment.setdefault("NODE_USE_ENV_PROXY", "1")
    arguments = forwarded or ["--help"]
    return subprocess.call([args.node, str(args.entry.resolve()), *arguments], cwd=root, env=environment)


if __name__ == "__main__":
    raise SystemExit(main())
