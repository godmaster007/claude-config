---
name: project-kickoff
description: Kick off a new piece of work properly: clarify the goal, check memory and connectors, write a plan with decisions up front, and set up threads. Use on 'start a new project', 'kick off X', or 'set up a thread for X'.
---

# Project kickoff

## 1. Ground
- Read project memory and any notes about this topic. Don't re-ask what memory already answers.
- Check what the work needs: repositories (`list_repos`), connectors (`ListConnectors`), and plugins or skills. List anything missing or failing as a click for Nick, not a blocker.

## 2. Define
Write these down in 5 lines or fewer:
- **Goal**: one sentence.
- **Done means**: observable checks.
- **Out of scope**.
- **Constraints**: deadline, budget, systems that must not be touched.

## 3. Plan
- Break the work into independent workstreams. Each one that can run in parallel becomes its own thread or sub-agent (see the swarm playbook in CLAUDE.md).
- For each workstream give the first concrete step and its output (a file, PR, doc or draft).
- Ask every open decision at once, each with a recommended default. Don't trickle questions out one at a time.

## 4. Set up
- Save the goal, decisions and workstreams to project memory, in one file named for the project.
- If something recurs (a report, a check, a sync), propose a scheduled task and create it paused.
- Start the workstreams once Nick approves the plan, or right away for reversible work.

## 5. Report
Send one short message: the goal, the workstreams with links, the decisions needed (if any), and what happens next.
