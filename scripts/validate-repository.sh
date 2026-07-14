#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "README.md"
  "CLAUDE.md"
  "CLAUDE.local.md"
  "WORKFLOW.md"
  ".env.example"
  ".claude/skills/agent-browser/SKILL.md"
  ".claude/skills/harness-local-server/SKILL.md"
  ".claude/skills/harness-playwright-evidence/SKILL.md"
  ".claude/skills/harness-linear-loop/SKILL.md"
  ".claude/skills/harness-quality-gate/SKILL.md"
  ".claude/skills/debug/SKILL.md"
  ".claude/skills/commit/SKILL.md"
  ".claude/skills/pull/SKILL.md"
  ".claude/skills/push/SKILL.md"
  ".claude/skills/land/SKILL.md"
  ".claude/skills/land/land_watch.py"
  ".claude/skills/linear/SKILL.md"
  ".github/pull_request_template.md"
  "docs/README.md"
  "docs/prd/README.md"
  "docs/plans/README.md"
  "docs/design/README.md"
  "docs/acceptance/README.md"
  "docs/operations/README.md"
)

for file in "${required_files[@]}"; do
  if [[ ! -f "$file" ]]; then
    printf 'Missing required file: %s\n' "$file" >&2
    exit 1
  fi
done

for script in scripts/*.sh; do
  [[ -f "$script" ]] || continue
  bash -n "$script"
done

python -m py_compile .claude/skills/land/land_watch.py

if [[ -d .agents ]]; then
  printf 'Unexpected generated directory: .agents\n' >&2
  exit 1
fi

if [[ -f skills-lock.json ]]; then
  printf 'Unexpected generated lock file: skills-lock.json\n' >&2
  exit 1
fi
