#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub for Rajendrasinh-AI.io ...\033[0m"

# Go To Project root because our deploy script is in deploy folder
echo -e "\033[0;32mNavigate to root of project\033[0m"
cd ..

# Build the project.
echo -e "\033[0;32mBuild the project...\033[0m"
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
echo -e "\033[0;32mGo To Public folder\033[0m"
cd public

# Add changes to git.
echo -e "\033[0;32mAdd changes to git\033[0m"
git add .

# Commit changes.
msg="Rebuild rajendrasinh-ai.io on `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
echo -e "\033[0;32mPushing change to rajendrasinh-ai.io at `date`...\033[0m"
git push origin master

# Come Back up to the Project Root
echo -e "\033[0;32mCome Back up to the Project Root\033[0m"
cd ..

# Commit submodule changes to main project
publishcommit="Deploy new site at rajendrasinh-ai.io on `date`"

# Add changes for public submodule to main repository
echo -e "\033[0;32mAdd and commit changes to git\033[0m"
git add public
git commit -m "$publishcommit"
# Push changes to main repository

echo -e "\033[0;32mPushing change to Rajendrasinh-AI main repository\033[0m"
git push origin master