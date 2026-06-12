from __future__ import annotations

import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
REQUIRED_KEYS = {
    "title",
    "domain",
    "status",
    "priority",
    "owner",
}
SKIP_PARTS = {
    ".git",
    "_archive",
    "node_modules",
}


def iter_markdown_files() -> list[Path]:
    files: list[Path] = []
    for path in ROOT.rglob("*.md"):
        if any(part in SKIP_PARTS for part in path.parts):
            continue
        files.append(path)
    return sorted(files)


def parse_frontmatter(text: str) -> dict[str, str] | None:
    if not text.startswith("---\n"):
        return None
    match = re.match(r"^---\n(?P<body>.*?)\n---\n", text, re.DOTALL)
    if not match:
        raise ValueError("front matter starts but does not close")
    values: dict[str, str] = {}
    for line in match.group("body").splitlines():
        if not line.strip() or line.lstrip().startswith("#"):
            continue
        if ":" not in line:
            continue
        key, value = line.split(":", 1)
        values[key.strip()] = value.strip().strip('"')
    return values


def main() -> int:
    missing_frontmatter: list[str] = []
    malformed: list[str] = []
    missing_keys: list[str] = []

    for path in iter_markdown_files():
        rel = path.relative_to(ROOT).as_posix()
        text = path.read_text(encoding="utf-8")
        try:
            frontmatter = parse_frontmatter(text)
        except ValueError as exc:
            malformed.append(f"{rel}: {exc}")
            continue

        if frontmatter is None:
            missing_frontmatter.append(rel)
            continue

        missing = sorted(REQUIRED_KEYS - set(frontmatter))
        if missing:
            missing_keys.append(f"{rel}: missing {', '.join(missing)}")

    if missing_frontmatter:
        print("WARN missing front matter:")
        for rel in missing_frontmatter:
            print(f"  - {rel}")

    if missing_keys:
        print("WARN incomplete front matter:")
        for rel in missing_keys:
            print(f"  - {rel}")

    if malformed:
        print("ERROR malformed front matter:")
        for item in malformed:
            print(f"  - {item}")
        return 1

    print(
        "Front matter validation completed: "
        f"{len(missing_frontmatter)} missing, {len(missing_keys)} incomplete, "
        f"{len(malformed)} malformed."
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
