#!/usr/bin/env bash
#
##
## Author: Victor Calderon
##
## Last Updated: 2018-08-17
##
## This script creates and modifies your '~/.ssh' directory
## to have it suitable for connecting to remote servers and Github
##
## Parameters
## -----------
## Options:
##    -h --help  --> Show the help text
##
## How to run this script from the terminal:
##
## >>> bash create_ssh.sh

## Help function
usage="bash create_ssh.sh [-h] [opt] -- Program that setups your ~/.ssh directory for proper use
where:
    -h, --help      show this help text

    Options for 'opt':
        -c, --create    Only creates necessary files and directories for SSH
        -g, --github    Creates the key-pair for Github and adds to 'config' file
        -a, --all       Creates files and folders, including key-pairs for SSH,
                        Github, etc.
"

## Functions

# - `.autocomplete.sh`
create_autocomplete_ssh(){
    ### Creates the file `.autocomplete.sh` and puts it in the HOME directory
    # Checking if file exists
    if [[ ! -f ${HOME}/.autocomplete.sh ]]; then
        # URL for file
        autocomplete_url="https://tinyurl.com/autocomplete-ssh-download"
        #Creating file
        echo ">>> Downloading '~/autocomplete.sh file'\n"
        curl -o $HOME/.autocomplete.sh -JLO ${autocomplete_url}
    fi
}

#  `SSH File creation`
ssh_files_create(){
    ### Creates files and folders for the `~/.ssh` directory
    SSH_DIR="$HOME/.ssh"
    ## -- Main SSH folder -- ##
    # Checking if directory exists
    if [[ ! -f ${SSH_DIR} ]]; then
        mkdir ${SSH_DIR}
    fi
    # Changing file/folder permission
    chmod 700 ${SSH_DIR}
    ## -- Config file -- ##
    if [[ ! -f ${SSH_DIR}/config ]]; then
        touch ${SSH_DIR}/config
    fi
    chmod 600 ${SSH_DIR}/config
    ## Authorized keys file
    if [[ ! -f ${SSH_DIR}/authorized_keys ]]; then
        touch ${SSH_DIR}/authorized_keys
    fi
    chmod 700 ${SSH_DIR}/authorized_keys
    ## `connections` folder
    if [[ ! -f ${SSH_DIR}/connections ]]; then
        mkdir ${SSH_DIR}/connections
    fi
    chmod 700 ${SSH_DIR}/connections
    ## SSH-keys folder
    if [[ ! -f ${SSH_DIR}/ssh_keys ]]; then
        mkdir ${SSH_DIR}/ssh_keys
    fi
    chmod 700 ${SSH_DIR}/ssh_keys
    ## Public Keys folder
    if [[ ! -f ${SSH_DIR}/pub_keys ]]; then
        mkdir ${SSH_DIR}/pub_keys
    fi
    chmod 700 ${SSH_DIR}/pub_keys
}

##################### --- Reading inputs --- #####################
# Options
file_opt=$1

if [[ ${file_opt} == '-h' ]]; then
  echo "==> Usage: $usage\n"
  # exit 0
fi

if [[ ${file_opt} == '-a' ]] || [[ ${file_opt} == '--all' ]]; then
    #statements
    create_autocomplete_ssh
fi