##
## Author: Victor Calderon
##
## Last Updated: 2018-08-05
##
## This is a compilation of useful `aliases` to use in research.

############################## --- GENERAL --- ################################
alias   lll='ls -lah'
alias   LLL=lll
alias   lla=lll
alias   llh='ls -lh'
alias   llt='ls -lahtr'
alias    LS='ls'
alias    sl='ls'
alias    SL=ls
alias CLEAR='clear'
alias   clc='clear'
alias   CLC='clear'
alias    en='emacs -nw'
alias pushd='cd -'
alias    CD='cd'
alias tree='tree -C'
alias crone='crontab -e'
alias cronl='crontab -l'
alias     jb='jupyter notebook'
alias timemachine='sudo sysctl debug.lowpri_throttle_enabled=0'
alias  untar_file='tar -zxvf $1'

# Aliases for the `bashrc`/`bash_profile` files
if [[ -f $HOME/.bashrc ]]; then
  alias    sb='source ~/.bashrc'
  alias   sbr='opensub ~/.bashrc'
else
  alias    sb='source ~/.bash_profile'
  alias   sbr='opensub ~/.bash_profile'
fi

####################### --- PROJECT STRUCTURE --- #############################
alias cookieproj='cookiecutter https://github.com/drivendata/cookiecutter-data-science'
alias cookieprojvc='cookiecutter https://github.com/vcalderon2009/cookiecutter-data-science-vc'
alias cookieprojastropy='cookiecutter gh:astropy/package-template --checkout cookiecutter'

####################### --- SCREEN AND TMUX --- ###############################
alias tmux_create='tmux new -s'
alias tmux_attach='tmux a -t'
alias tmux_ls='tmux ls'
# Screen-related commands
alias sckill='screen -S $1 -X quit'
alias    sls='screen -ls'
alias    slr='screen -r'
alias   slss='screen -S'

####################### --- EXTRACTING FILES --- ##############################
## Extracting compressed files
## Taken from 'https://github.com/swincas/scripts/blob/master/extract.sh'
extract () {
    if [ -f $1 ] ; then
        case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1     ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

########################## --- GIT-RELATED --- ################################
#
# https://help.github.com/articles/configuring-a-remote-for-a-fork/
#
## Adding GIT remote repository to current GIT repository
git_add_remote(){
                  git remote -v
                  git remote add upstream $1
                  git remote -v
                }
## Updating local GIT with respect to forked repository.
git_ref(){
           git remote -v
           git fetch upstream
           git checkout master
           git merge upstream/master
           git merge upstream/master
         }

## Other General commands
alias          gp='git push origin master'
alias        gcom='git commit -m'
alias        gadd='git add'
alias        gst='git status'
alias overleafgithub='git pull; git push github master'
alias git_update_upstream='git fetch upstream; git checkout master; git merge upstream/master; git merge upstream/master'
alias git_checkout_remote='git checkout --track'
alias gitclean='git clean -fxd'

########################## --- SSH-RELATED --- ################################
alias skeys='ssh-add -K ~/.ssh/ssh_keys/*'
alias ssho='ssh -o PubkeyAuthentication=no'

########################## --- ANACONDA-RELATED --- ###########################
alias sa='conda activate'
alias sd='conda deactivate'
alias py2env='conda activate py2'
alias py2deact='conda deactivate py2'

########################## --- SSH-LOGINS --- ################################
#
# This is where you add the aliases to your remote servers!!


