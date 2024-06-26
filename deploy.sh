#!/bin/bash
# git add .
# git commit -m "update"
# git push

# cd github-pages
# git rm -r ./*
# cd ..
# yarn build
# cp -r ./dist/* github-pages

cd github-pages
dt=$(date)
msg="deploy at ${dt}"
echo "===== $msg ====="
git add .
git commit -m "$msg"
git push --force
