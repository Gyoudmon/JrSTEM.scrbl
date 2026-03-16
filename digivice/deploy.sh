#!/bin/zsh

RepoName="JrSTEM.scrbl"
BranchName="terminus"
DomainName="linguisteen.org"

WebRoot="$(pwd)/compiled/Gyoudmon"
ShadowRepo="${HOME}/Shadow/${RepoName}"

if ! test -d ${ShadowRepo}; then
    mkdir -p ${ShadowRepo}

    # WARNING: the SSH protocol can be blocked by the proxy
    git clone --recurse-submodules git@github.com:Gyoudmon/JrSTEM.scrbl ${ShadowRepo}
    S=$?

    if test ${S} -ne 0; then
        rmdir ${ShadowRepo}
        exit ${S}
    fi
fi

cd $ShadowRepo

branch=`git symbolic-ref HEAD 2>/dev/null`;
test $? -eq 0 && branch=${branch#refs/heads/} || branch='(*)';
remote=`git config branch.${branch}.remote 2>/dev/null`;
git_name=`git config remote.${remote}.url 2>/dev/null`;
if test -z "${git_name}"; then
    test "${repo_info[3]}" = "true" && git_name=`cd ${repo_info[1]} && pwd` || git_name=`cd ${repo_info[1]}/.. && pwd`;
fi
git_name=`basename ${git_name}`;

if test "${git_name}" != "${RepoName}"; then
    echo "not the target repo, expected ${RepoName}, got ${git_name}"
    rm -fr ${ShadowRepo}
    exit 1
fi

if ! test -d ${WebRoot}; then
    echo "skipped empty website."
    exit 0
fi

if test "${branch}" != "${BranchName}"; then
    git branch --all | grep ${BranchName} > /dev/null 2>/dev/null

    if test $? -eq 0; then
        git checkout ${BranchName}
        git pull origin ${BranchName}
    else
        git checkout --orphan ${BranchName}
        git rm -rf .
        git commit --allow-empty -m "Mission Start"
        git push --force origin ${BranchName}
    fi
fi

echo "🚀 sync the static website..."

rsync -av --delete --exclude=".nojekyll" --exclude="CNAME" "${WebRoot}/" "${ShadowRepo}/docs"
touch docs/.nojekyll
echo "${DomainName}" > docs/CNAME
git add --all

git commit -m "wisemon weave: $(date +'%Y-%m-%d %H:%M:%S')"
if test $? -eq 0; then
    git push --force origin ${BranchName}
fi
