# Git & GitHub Version Control Workflow

This document outlines the standard Git and GitHub workflows used for managing the source code in this repository.

## 1. Repository Initialization and Management

To initialize a new local repository:
```bash
git init
git remote add origin <repository-url>
```

## 2. Branch Creation and Management

We use a feature-branching strategy. The main branch (`main` or `master`) contains production-ready code.

**Create and switch to a new branch:**
```bash
git checkout -b feature/new-script
```

**List all branches:**
```bash
git branch -a
```

## 3. Commit Lifecycle and Staging

**Check status:**
```bash
git status
```

**Stage specific files or all changes:**
```bash
git add file_name.sh
# OR
git add .
```

**Commit with a descriptive message:**
```bash
git commit -m "feat: Add new resource monitoring script"
```

## 4. Collaboration, Merge, and Conflict Resolution

**Push changes to remote repository:**
```bash
git push -u origin feature/new-script
```

**Merge changes into main:**
```bash
git checkout main
git pull origin main
git merge feature/new-script
```

If conflicts arise during a merge, open the conflicting files, resolve the markers (`<<<<<<<`, `=======`, `>>>>>>>`), and then stage and commit the resolved files.

## 5. Rebase and Cherry-pick Operations

**Rebase feature branch on top of main:**
(Use carefully, only on local branches not pushed to others)
```bash
git checkout feature/new-script
git rebase main
```

**Cherry-pick a specific commit to your current branch:**
```bash
git cherry-pick <commit-hash>
```

## 6. Stash and Restore Workflows

If you need to switch branches but have uncommitted work:

**Stash changes:**
```bash
git stash
```

**Apply the most recent stash:**
```bash
git stash pop
```
