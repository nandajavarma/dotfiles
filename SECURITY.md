# Security Review Guidance

Review the repository's text-based source and configuration before concluding
the scan. Prioritize:

- Shell scripts and shell configuration for command injection, unsafe quoting,
  untrusted environment variables, downloads, and unintended code execution.
- Emacs, Vim, tmux, and Git configuration for unsafe evaluation, hooks, plugin
  loading, credential exposure, and execution triggered by opening a project.
- Dev Container and Defense Factory configuration for unsafe runtime settings,
  untrusted build inputs, and supply-chain risks.
- File and path handling for traversal, symlink, overwrite, and permission
  problems.

Ignore `.git` internals and static image assets unless application code treats
them as executable input. Do not modify repository files during the scan.

Only report findings with a concrete attacker-controlled input, reachable code
path, and security impact. Record the files reviewed and rejected hypotheses
even when no vulnerability is found.
