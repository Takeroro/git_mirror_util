#!/bin/sh

#-------------------------------------
#把github的代码同步到gitlab镜像
#用法：
# ./git_mirror.sh {$githubRepo} {$gitlabRepo}
#example:
# ./git_mirror.sh CocoaPods/Specs mirrors/Cocoapods_Specs
#
#-------------------------------------

GIT_REPO=~/Documents/work/git_script/github_tmp_repo
 
GIT="Specs.git"

targetGit=$1
mirrorGit=$2

echo "${targetGit}"
echo "${mirrorGit}"


##GITLab
GITLAB_GIT="https://code.yy.com/${mirrorGit}"
 
#GITHub
GITHUB_GIT="https://github.com/${targetGit}"
 
echo "/mirror start-------------------------------------------------"

echo "gitlab:${GITLAB_GIT}"
echo "github:${GITHUB_GIT}"

echo "begin_time:"`date`

#Temp Dir
GIT_DIR=${GIT_REPO}/${GIT}
 
cd ${GIT_REPO}
rm -rf ${GIT_DIR}
echo `git clone --bare ${GITHUB_GIT}`
echo "clone result:"$?
cd ${GIT_DIR}
git push --mirror ${GITLAB_GIT}
echo "push result:"$?
cd ..
rm -rf ${GIT_DIR}

echo "end_time:"`date`
echo "\mirror end-------------------------------------------------"

