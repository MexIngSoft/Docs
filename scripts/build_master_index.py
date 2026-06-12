from __future__ import annotations

import json
import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / "_meta" / "generated" / "master-index.json"
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


def parse_frontmatter(text: str) -> dict[str, str]:
    if not text.startswith("---\n"):
        return {}
    match = re.match(r"^---\n(?P<body>.*?)\n---\n", text, re.DOTALL)
    if not match:
        return {}
    values: dict[str, str] = {}
    for line in match.group("body").splitlines():
        if not line.strip() or line.lstrip().startswith("#"):
            continue
        if ":" not in line:
            continue
        key, value = line.split(":", 1)
        values[key.strip()] = value.strip().strip('"')
    return values


def first_heading(text: str) -> str:
    for line in text.splitlines():
        if line.startswith("# "):
            return line[2:].strip()
    return "PENDIENTE_DE_DEFINIR"


def infer_domain(path: Path) -> str:
    parts = path.relative_to(ROOT).parts
    if not parts:
        return "other"
    top = parts[0]
    return {
        "00_audit": "audit",
        "01_core_erp": "core",
        "02_projects": "business",
        "03_standards": "standards",
        "04_integrations": "integration",
        "_meta": "meta",
        "agents": "agents",
        "templates": "templates",
        "pendientes": "future",
    }.get(top, "other")


def main() -> int:
    rows = []
    for path in iter_markdown_files():
        text = path.read_text(encoding="utf-8")
        frontmatter = parse_frontmatter(text)
        rel = path.relative_to(ROOT).as_posix()
        rows.append(
            {
                "path": rel,
                "title": frontmatter.get("title") or first_heading(text),
                "domain": frontmatter.get("domain") or infer_domain(path),
                "status": frontmatter.get("status") or "unknown",
                "priority": frontmatter.get("priority") or "unknown",
                "owner": frontmatter.get("owner") or "PENDIENTE_DE_DEFINIR",
            }
        )

    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    OUTPUT.write_text(
        json.dumps(rows, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    print(f"Wrote {OUTPUT.relative_to(ROOT).as_posix()} with {len(rows)} entries.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
