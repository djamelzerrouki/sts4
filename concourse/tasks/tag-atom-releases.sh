#!/bin/bash
set -e 
# set -x
workdir=$(pwd)
out=${workdir}/out

git config --global user.email "kdevolder@pivotal.io"
git config --global user.name "Kris De Volder"

for package in atom-* ; do
    echo "Processing ${package}..."

    mkdir "${out}/${package}"
    cd "${out}"
    git clone "${workdir}/${package}/.git"

    cd ${package}
    tag=v$(cat package.json | jq -r ".version")
    echo "Tag: ${tag}"
    git tag $tag
done