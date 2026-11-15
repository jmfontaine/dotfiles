# Working with me

- When I ask a question or for recommendations, answer and stop. Build only after I
  approve. The agent review inside a pull request delivery is not such a request: fix
  its findings as the `github-workflow` skill describes, without asking.
  - When I like a proposal except for one part, that is feedback, not approval.
    Propose a revision of that part and wait for an explicit go-ahead before you
    change or commit anything.
  - An idea or preference I voice while we discuss is input to the proposal, not
    approval. Build only after an explicit go-ahead.
- When you present options, say which one you recommend and why.
- I often step away while you work, even in interactive sessions. Get what you need
  from me in batches so I can do other things in between:
  - At the start of a task, ask every decision you can foresee in one numbered batch,
    each with your recommended answer.
  - When the task will commit, check the agent signing key in that same batch:
    `python3 ~/.agents/skills/parallel-issues/scripts/parallel_issues.py key`, from
    inside the repository. Run `key --load`, the only 1Password prompt, only when no
    key is loaded or it has under 8 hours left, and only while I am at the keyboard:
    before you ask me to approve a plan, never after I have left. Sign every commit
    and push with the key, never through my SSH agent:
    `python3 …/parallel_issues.py exec -- git commit …`.
  - Don't stop for one question. Take the recommended option when it is reversible
    and say so in the report; otherwise park the question and keep working on
    everything that doesn't depend on it. Stop only when nothing else can move.
  - When you stop, end with one "I need you for: …" list. Send the same list to my
    phone (`parallel_issues.py notify "<short title>"`, from inside the repository,
    with the list on standard input) when the turn ran 5 minutes or more since my
    last message, or when the stop blocks work that ran unattended.
  - When work keeps running after your turn ends, such as agents you launched, say
    "Nothing needs you until …". When nothing is running and the next step is mine,
    say "Nothing is running. Next step: …" instead. Never tell me to go AFK or that
    nothing needs me while nothing is running.
- Once I have approved a change and it is finished and checked, commit it without
  asking, on whatever branch the work is on; amending an unpushed commit needs no
  question either. Then push it, outside quiet hours and after the visibility check.
  Merges, releases, force pushes and anything else that rewrites pushed history stay
  mine: ask.
- Agent skills live in /Users/jmf/Projects/Personal/agent-skills/skills/<name>.
  ~/.agents/skills holds installed copies: edit the repo, run its `just qa`, then
  `just install`. Never edit only the installed copy.
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
- When a skill asks for a reviewer subagent, spawn the `reviewer` agent: set
  `"agent": "reviewer"` inside each `tasks[]` item. A top-level `agent` is silently
  ignored, and the review then runs as the default `task` agent on another model.
