###
### This is an example of a `bashrc` file
###
### Compiled by Victor Calderon
###
### Mainly taken from:
# https://medium.com/purple-rock-scissors/customizing-your-terminal-with-bash-a22852abc447

########################## --- LOADING MAIN BASHRC FILE ---- ##################
if [[ -f /etc/.bashrc ]]; then
    . /etc/.bashrc
fi

########################## --- BASH COMPLETION ---- ###########################
# Works for MACs
# See: http://davidalger.com/development/bash-completion-on-os-x-with-brew/
if ( which brew >> /dev/null ); then
    if [[ -f $(brew --prefix)/etc/bash_completion ]]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi

################################ ALIASES ######################################
## This sources the aliases in '~/.aliases'
if [[ -f ~/.aliases ]]; then
    . ~/.aliases
fi

############################ COLOR CODING #####################################
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

############################## GIT STATUS #####################################
## -- Git Status -- ##
alias s=git_status
function git_status() {
        if git ls-files >& /dev/null; then
              git branch -avv;
              echo "";
              git status -s
        else
             echo 'This is not a git directory'
        fi
}

############################# COMMAND-LINE PROMPT #############################
# Color Codes
if [[ -f ~/.color_codes ]]; then
    . ~/.color_codes
else
    # Normal Intensity
    IBlack='\e[0;90m' # Black
    IRed='\e[0;91m' # Red
    IGreen='\e[0;92m' # Green
    IYellow='\e[0;93m' # Yellow
    IBlue='\e[0;94m' # Blue
    IPurple='\e[0;95m' # Purple
    ICyan='\e[0;96m' # Cyan
    IWhite='\e[0;97m' # White
    Color_Off='\e[0m' # Text Reset
    # Bold Intensity
    BIBlack="\[\033[1;90m\]"      # Black
    BIRed="\[\033[1;91m\]"        # Red
    BIGreen="\[\033[1;92m\]"      # Green
    BIYellow="\[\033[1;93m\]"     # Yellow
    BIBlue="\[\033[1;94m\]"       # Blue
    BIPurple="\[\033[1;95m\]"     # Purple
    BICyan="\[\033[1;96m\]"       # Cyan
    BIWhite="\[\033[1;97m\]"      # White
fi

# Git Branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Setting up the look of the command prompt
PROMPT_COMMAND=prompt_func
 
function prompt_func() {
    # Initialize the prompt
    PS1=""

    # Add a newline
    PS1="\n"

    # Status of last command
    PS1+='`if [ $? = 0 ]; then echo "\[\033[01;32m\]•"; else echo "\[\033[01;31m\]•"; fi` '

    # Command history number
    PS1+="$ICyan\!$Color_Off "

    # User and hostname
    PS1+="$IYellow\u@${IGreen}\h$Color_Off "

    # Current time
    PS1+="`date +%H:%M:%S` "

    # Working branch (If folder is a GIT folder)
    PS1+="$ICyan\$(parse_git_branch) "

    # Working directory
    PS1+="$IYellow[\w]$Color_Off"

    # Add a newline
    PS1+="\n"

    # Add a trailing dollar sign
    PS1+="\$ "
}

############################# HISTORY FILE ####################################
export HISTSIZE=100000 # Increase history file length
export HISTFILESIZE=100000 # Increase history file size

############################# OPERATING SYSTEM ################################
## -- Operating system details -- ##
if ( which lsb_release >> /dev/null ); then
    OS=$(lsb_release -si)
    ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
    VER=$(lsb_release -sr)
    echo $OS $ARCH $VER
fi

################################# SSH KEYS ####################################
## Loading SSH Agent
if [[ -z "$SSH_AUTH_SOCK" ]]; then
    eval `ssh-agent -s`
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

## Loading SSH Keys
ssh-add ~/.ssh/ssh_keys/* 2>/dev/null

#################### SSH HOSTNAME AUTOCOMPLETION ##############################
## -- Autocomplete SSH Hostnames -- ##
if [[ -f $HOME/.autocomplete.sh ]]; then
    . $HOME/.autocomplete.sh
fi

