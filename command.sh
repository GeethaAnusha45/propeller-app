#!/bin/bash
# Step 1: Create React App
npx create-react-app propeller-app
cd propeller-app

# Step 2: Initialize git and create GitHub repo (interactive login required)
git init
git add .
git commit -m "Initial commit"
gh auth login
gh repo create propeller-app --public --source=. --remote=origin
git push -u origin master

# Step 3: Create branch for logo update
git checkout -b update_logo

# Step 4: Replace logo (manual step)
# (Replace src/logo.svg with the new file and update src/App.js link)

# Step 5: Commit & push the change
git add src/logo.svg
git commit -m "Updated logo.svg and link"
git push -u origin update_logo

# Step 6: Create and merge PR via GitHub CLI
gh pr create --title "Update logo and link" --body "Replaced default logo and updated link" --base master --head update_logo
gh pr merge --merge --delete-branch

# REPO_URL https://github.com/GeethaAnusha45/propeller-app

