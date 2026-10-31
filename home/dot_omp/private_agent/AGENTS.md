# Working with me

- When I ask a question or for recommendations, answer and stop. Build only after I
  approve. The agent review inside a pull request delivery is not such a request: fix
  its findings as the `github-workflow` skill describes, without asking.
- When you present options, say which one you recommend and why.
- I often step away while you work, even in interactive sessions. Get what you need
  from me in batches so I can do other things in between:
  - At the start of a task, ask every decision you can foresee in one numbered batch,
    each with your recommended answer.
  - When the task will commit, load the agent signing key in that same batch, the only
    1Password prompt:
    `python3 ~/.agents/skills/parallel-issues/scripts/parallel_issues.py key --load`,
    from inside the repository. Sign every commit and push with it, never through my SSH
    agent: `( e=$(python3 …/parallel_issues.py env) && eval "$e" && git commit … )`, in
    a subshell so nothing leaks into the session's shell.
  - Don't stop for one question. Take the recommended option when it is reversible
    and say so in the report; otherwise park the question and keep working on
    everything that doesn't depend on it. Stop only when nothing else can move.
  - When you stop, end with one "I need you for: …" list and send the same list to my
    phone: `parallel_issues.py notify "<short title>"`, from inside the repository,
    with the list on standard input.
  - When work keeps running after your turn ends, such as agents you launched, say
    "Nothing needs you until …". When nothing is running and the next step is mine,
    say "Nothing is running. Next step: …" instead. Never tell me to go AFK or that
    nothing needs me while nothing is running.
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
  - Never assume quiet hours: run `quiet-hours status` before citing them. Outside
    them, work normally; don't hold back because they start later. Stop only at the
    boundary itself.
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
