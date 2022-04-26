#!/usr/bin/env sh

if [ -z $1 ]
then
    echo "You MUST specify target branch!"
    exit 1
fi
if [ -z $2 ]
then
    echo "You MUST specify version"
    exit 1
fi

echo "Deploying to GitHub pages, to branch $1"
echo "Build version $2"

set -e
# Change next 2 lines according to your application scripts!
npm run test
npm run build

cd dist
git init
git branch -M main
git add -A
git commit -m "'deploy v$2'"
git tag "$2"
git push -f git@github.com:IntegerVector/flash-cards.git main:$1
git push git@github.com:IntegerVector/flash-cards.git --tags
cd -
