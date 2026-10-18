# Working with me

- When I ask a question or for recommendations, answer and stop. Build only after I
  approve.
- When you present options, say which one you recommend and why.
- Agent skills live in /Users/jmf/Projects/Personal/agent-skills/skills/<name>.
  ~/.agents/skills holds installed copies: edit the repo, run its `just qa`, then sync
  the installed copy. Never edit only the installed copy.
- Scratch files are working material for a task in progress that nobody needs once the
  task is done. They go in `.scratch/` at the repository root, which git ignores
  globally; unattended agents use their worktree's git directory instead.
  - In: reviews (REVIEW.md), plans (PLAN*.md, wave plans), improvement lists, research
    exports, draft issue and pull request bodies, handoff notes, and data the task
    reads or produces (JSON, JSONL, CSV), such as issue exports or benchmark results.
  - Code only as probes: throwaway reproductions and checks for the current task, in
    `.scratch/probes/`. Project code, tests, CI and recipes never import, run or cite
    them. A probe needed twice is a tool: move it into the project through a pull
    request.
  - Out: anything needed after the task (decisions go to an ADR or an issue, guidance
    to AGENTS.md, specs to the brief or the issue), secrets, build outputs, copies of
    data that has a home (name its path instead), and private context to keep
    (Notion).
  - Never commit them unless I ask, link them from GitHub, or cite them, their names
    or their finding IDs in committed files.
  - Delete each one as soon as its content is filed or its task is done, in the same
    session. At the end of a session, list any left behind and why. Move one to
    `.scratch/archive/` only when I ask to keep it.
- Only touch repositories under ~/Projects/Personal, ~/Projects/MoxieForge,
  ~/Projects/Third Parties, and the chezmoi source.
- When a skill asks for a reviewer subagent, spawn the `reviewer` agent: set
  `"agent": "reviewer"` inside each `tasks[]` item. A top-level `agent` is silently
  ignored, and the review then runs as the default `task` agent on another model.
- Quiet hours. I don't work on personal projects during my day job's working hours.
  You commit, push and post on GitHub in my name, so what you do there cannot be
  told apart from what I do. Quiet hours (weekdays from 8:30 to 17:30, working hours
  with a margin) make sure no agent creates the false impression that I worked on
  these projects then:
  - During quiet hours, make no commits and no GitHub writes: no push, pull request,
    issue, comment, review, merge, release, or any other `gh` write.
  - Nothing pushed later may carry a time from quiet hours: no commit or tag dated in
    them, and no clock times from them in files, commit messages or pull request
    text, such as benchmark output or logs.
  - `quiet-hours` enforces the first point, and its refusals start with "quiet
    hours". An agent already running when they begin may finish what it can do
    locally, then run `quiet-hours wait` with no timeout and retry once it returns.
  - Never work around it: no `--no-gpg-sign`, no backdating (`--date`,
    `GIT_*_DATE`), no other signing program, no `gh` other than the one on PATH, and
    nothing scheduled to act on GitHub during quiet hours, such as auto-merge
    (`gh pr merge --auto`).
  - Quiet hours lift only on a day I name in the conversation, such as a holiday or a
    day off: run `quiet-hours allow <day>` for it.
- Issues, pull requests, commits and comments on a public repository are public.
  Check the repository's visibility before pushing or posting
  (`gh repo view --json visibility`), and keep out anything that should stay
  private: when I was or was not active, details about my day job or my employer,
  and other personal information.
