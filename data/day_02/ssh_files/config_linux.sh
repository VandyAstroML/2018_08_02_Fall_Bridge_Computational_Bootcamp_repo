Host *
ControlMaster auto
ControlPath ~/.ssh/connections/%C
ControlPersist 1m
ServerAliveInterval 30
ServerAliveCountMax 10
XAuthLocation /opt/X11/bin/xauth
AddKeysToAgent yes

## Connects to Github
Host github.com
HostName github.com
User git
IdentityFile ~/.ssh/ssh_keys/github_key
IdentitiesOnly yes
PreferredAuthentications publickey

## Connects to a remote Server via SSH
Host server_name
HostName path.to.server
User username
IdentityFile ~/.ssh/ssh_keys/server_key
IdentitiesOnly yes
PreferredAuthentications publickey
ForwardX11 yes