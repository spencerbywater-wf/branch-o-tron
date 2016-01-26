# branch-o-tron
Super branch and repo list.

## Description
If you're using [bam_workspace](https://github.com/ryanhanks-wf/bam_workspace) to set up your dev environment, you can use this to display all of the repositories in your workspace, which branch each repository is currently on, and the status of the branch (if there are any unstaged changes).

## How to Use
#### Download and put it somewhere
Download [branch-o-tron.sh](https://raw.githubusercontent.com/spencerbywater-wf/branch-o-tron/master/branch-o-tron.sh) and put it somewhere you won't accidentally delete it.
#### Give branch-o-tron an alias in zsh
I'm assuming zsh is being used, but other shells probably have similar options.
Open up your `~/.zshrc` file. (if one does not exist, create it in ~/) Somewhere at the bottom, add a line that says something like:
```
alias bot="sh /path/to/branch-o-tron.sh"
```
Save, and reload your zsh shell by running
```
source ~/.zshrc
```
#### Use!
With your new alias set up, simply run `bot` in the root of your workspace to see the results:

![branch-o-tron results]
(https://raw.github.com/spencerbywater-wf/branch-o-tron/master/img/bam.png)

Green means no unstaged changes, yellow means there are unstaged changes.

If your workspace is in a different directory, you can also enter `bot path` to unleash branch-o-tron on that directory.

