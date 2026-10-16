# Working with me

- When I ask a question or for recommendations, answer and stop. Build only after I
  approve.
- When you present options, say which one you recommend and why.
- Agent skills live in /Users/jmf/Projects/Personal/agent-skills/skills/<name>.
  ~/.agents/skills holds installed copies: edit the repo, run its `just qa`, then sync
  the installed copy. Never edit only the installed copy.
- Scratch and planning files (REVIEW.md, IMPROVEMENTS.md, PLAN*.md, research exports) go
  in `.scratch/` at the repository root, which git ignores globally. They stay
  uncommitted unless I ask, and nothing filed on GitHub may refer to them. Delete them
  once their content is filed; move one to `.scratch/archive/` only when I ask to keep
  it.
- Only touch repositories under ~/Projects/Personal, ~/Projects/MoxieForge,
  ~/Projects/Third Parties, and the chezmoi source.
- When a skill asks for a reviewer subagent, spawn the `reviewer` agent: set
  `"agent": "reviewer"` inside each `tasks[]` item. A top-level `agent` is silently
  ignored, and the review then runs as the default `task` agent on another model.
- Quiet hours: nothing on GitHub may show activity on weekdays from 8:30 to 17:30,
  unless I allowed that day. During them: no commits, no GitHub writes (push, pull
  request, issue, comment, review, merge, release, any `gh` write). Afterwards,
  nothing pushed may carry a time from them: commit and tag dates, or clock times
  in files, commit messages and pull request text (benchmark output, logs). Local
  work that needs neither goes on. `quiet-hours` enforces the commits and writes,
  and the refusal says "quiet hours": finish the other work, then run `quiet-hours
  wait` with no timeout and retry once it returns. Never work around it: no
  `--no-gpg-sign`, no backdating (`--date`, `GIT_*_DATE`), no other signing program,
  no `gh` other than the one on PATH, and nothing scheduled to act on GitHub inside
  quiet hours, such as auto-merge (`gh pr merge --auto`). Run `quiet-hours allow
  <day>` only for a day I name in the conversation.
