#!/usr/bin/env sh

if [ -z $1 ]
then
    echo "You MUST specify repo!"
    exit 1
fi
if [ -z $2 ]
then
    echo "You MUST specify target branch!"
    exit 1
fi
if [ -z $3 ]
then
    echo "You MUST specify version"
    exit 1
fi

echo "Deploying to GitHub pages $1, to branch $2"
echo "Build version $3"

set -e
# Change next 2 lines according to your application scripts!
npm run test
npm run build

cd dist
git init
git branch -M main
git add -A
git commit -m "'deploy v$3'"
git tag "$3"
git push -f $1 main:$2
git push $1 --tags
cd -
