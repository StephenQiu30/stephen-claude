#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "README.md"
  "CLAUDE.md"
  "CLAUDE.local.md"
  "WORKFLOW.md"
  ".claude/skills/harness-local-server/SKILL.md"
  ".claude/skills/harness-playwright-evidence/SKILL.md"
  ".claude/skills/harness-linear-loop/SKILL.md"
  "examples/symphony-harness-smoke/README.md"
  "examples/symphony-harness-smoke/package.json"
  "examples/symphony-harness-smoke/.env.example"
  "examples/symphony-harness-smoke/src/server.mjs"
  "examples/symphony-harness-smoke/scripts/verify.sh"
  "examples/symphony-harness-smoke/scripts/render-workpad.mjs"
  "examples/symphony-harness-smoke/tests/e2e/harness.spec.mjs"
  "examples/symphony-harness-smoke/playwright.config.mjs"
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
grep -q "name: harness-local-server" .claude/skills/harness-local-server/SKILL.md
grep -q "bootable" .claude/skills/harness-local-server/SKILL.md
grep -q "health check" .claude/skills/harness-local-server/SKILL.md
grep -q "env.example" .claude/skills/harness-local-server/SKILL.md
grep -q "logs" .claude/skills/harness-local-server/SKILL.md
grep -q "name: harness-playwright-evidence" .claude/skills/harness-playwright-evidence/SKILL.md
grep -q "Playwright" .claude/skills/harness-playwright-evidence/SKILL.md
grep -q "video start" .claude/skills/harness-playwright-evidence/SKILL.md
grep -q "video stop" .claude/skills/harness-playwright-evidence/SKILL.md
grep -q "trace" .claude/skills/harness-playwright-evidence/SKILL.md
grep -q "name: harness-linear-loop" .claude/skills/harness-linear-loop/SKILL.md
grep -q "Linear API" .claude/skills/harness-linear-loop/SKILL.md
grep -q "## Claude Workpad" .claude/skills/harness-linear-loop/SKILL.md
grep -q "upload video evidence" .claude/skills/harness-linear-loop/SKILL.md
grep -q "Human Review" .claude/skills/harness-linear-loop/SKILL.md
grep -q "harness-local-server" examples/symphony-harness-smoke/README.md
grep -q "harness-playwright-evidence" examples/symphony-harness-smoke/README.md
grep -q "harness-linear-loop" examples/symphony-harness-smoke/README.md
grep -q "## Claude Workpad" examples/symphony-harness-smoke/scripts/render-workpad.mjs
grep -q "video: 'on'" examples/symphony-harness-smoke/playwright.config.mjs
grep -q "trace: 'on'" examples/symphony-harness-smoke/playwright.config.mjs
grep -q "Test-first Evidence" .github/pull_request_template.md

bash examples/symphony-harness-smoke/scripts/validate-structure.sh

git diff --check
