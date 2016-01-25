# Title: Branch Overview
# Author: Spencer Bywater
# Date: 25 Jan 2016, Research Day
# Description: If using a bam_workspace, displays the repositories in your 
# 			   workspace, which branch they are on, and if the branch has
# 			   any unstaged changes.

PINK='95'
BLUE='94'
LIGHT_BLUE='34'
GREEN='92'
YELLOW='93'
RED='91'
LIGHT_GRAY='37'
DEFAULT='0'

LENGTH=80

function print_bar {
	printf -v line '%*s' "54"
	printf "\t+${line// /=}+\n"
}

function print_table_headers {
	print_bar

	printf '\t| \033['${LIGHT_GRAY}m"REPO"'\033['m
	printf '%*.*s' 0 $((LENGTH - 38)) "$(printf '%0.1s' " "{1..100})"
	printf '\033['${LIGHT_GRAY}m"BRANCH"'\033['m" |\n"

	print_bar
}

function dir_blaster {
	if [ -d .git ]; then
		REPO='\033['${LIGHT_BLUE}m"$(basename `git rev-parse --show-toplevel`)"'\033['m
		SPLIT=' is in branch: '
		if [ -n "$(git diff-index --name-only HEAD --)" ]; then
			BRANCH='\033['${YELLOW}m"$(git rev-parse --abbrev-ref HEAD)"'\033['m
		else
			BRANCH='\033['${GREEN}m"$(git rev-parse --abbrev-ref HEAD)"'\033['m
		fi

		printf '\t| '
		printf $REPO
		printf '%*.*s' 0 $((LENGTH - ${#REPO} - ${#BRANCH} )) "$(printf '%0.1s' "-"{1..100})"
		printf $BRANCH
		printf " |\n"
	# else
		# git rev-parse --git-dir 2> /dev/null;
	fi;
}

# Save current directory and switch to root of workspace
pushd . >/dev/null
BASE_DIR=/Users/$USER/workspaces/bam
cd $BASE_DIR

# Get details for bam repository
echo 
print_table_headers
dir_blaster
cd repos

# Loop through git repos in /repos folder
for d in */ ; do
	cd $d
	#echo ${PWD##*/}
	dir_blaster
	cd ..
done
print_bar
echo

# Restore starting directory
popd >/dev/null
