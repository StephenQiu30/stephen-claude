#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "README.md"
  "CLAUDE.md"
  "CLAUDE.local.md"
  "WORKFLOW.md"
  ".claude/skills/harness-setup/SKILL.md"
  ".claude/skills/harness-verify/SKILL.md"
  ".github/pull_request_template.md"
  "docs/README.md"
  "docs/TEMPLATE.md"
  "docs/prd/README.md"
  "docs/plans/README.md"
  "docs/design/README.md"
  "docs/acceptance/README.md"
  "docs/operations/README.md"
  "openspec/config.yaml"
)

for file in "${required_files[@]}"; do
  test -f "$file"
done

grep -q "## Test-First PR 提交规范" CLAUDE.md
grep -q "test: add failing tests for xxx" CLAUDE.md
grep -q "impl: make xxx tests pass" CLAUDE.md
grep -q "中间产物" CLAUDE.md
grep -q "npm test" CLAUDE.md
grep -q "## Symphony-ready 编排原则" CLAUDE.md
grep -q "Linear ticket" CLAUDE.md
grep -q "## Claude Workpad" CLAUDE.md
grep -q "Human Review" CLAUDE.md
grep -q "Rework" CLAUDE.md
grep -q "Playwright" CLAUDE.md
grep -q "tracker:" WORKFLOW.md
grep -q "kind: linear" WORKFLOW.md
grep -q "project_slug" WORKFLOW.md
grep -q "## Claude Workpad" WORKFLOW.md
grep -q "Human Review" WORKFLOW.md
grep -q "name: harness-setup" .claude/skills/harness-setup/SKILL.md
grep -q "one-command startup" .claude/skills/harness-setup/SKILL.md
grep -q "health check" .claude/skills/harness-setup/SKILL.md
grep -q "env.example" .claude/skills/harness-setup/SKILL.md
grep -q "logs" .claude/skills/harness-setup/SKILL.md
grep -q "name: harness-verify" .claude/skills/harness-verify/SKILL.md
grep -q "Playwright" .claude/skills/harness-verify/SKILL.md
grep -q "screenshot" .claude/skills/harness-verify/SKILL.md
grep -q "trace" .claude/skills/harness-verify/SKILL.md
grep -q "## Claude Workpad" .claude/skills/harness-verify/SKILL.md
grep -q "Human Review" .claude/skills/harness-verify/SKILL.md
grep -q "Test-first Evidence" .github/pull_request_template.md

git diff --check
