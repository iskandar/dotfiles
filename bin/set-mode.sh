#!/usr/local/bin/bash

# set -x

DESIRED=${1:-work}
# These vars must be set elsewhere (in .exports, maybe)
# WORK_DC=lon5
# WORK_BASTION_KEY=$HOME/.ssh/balabit_rsa
# WORK_BASTION_HOST=cbast.${WORK_DC}.corp.rxxx

USERNAME=$(whoami)
SSH_DIR=$HOME/.ssh

echo "----> Creating SSH config files"
echo "  ==> 'home'"
cat > ${SSH_DIR}/config-home <<EOF
##
# SSH 'home' config generated $(date)
##

Host localhost
     ProxyCommand none
EOF

echo "  ==> 'work'"
cat > ${SSH_DIR}/config-work <<EOF
##
# SSH 'work' config generated $(date)
##

Host localhost
     ProxyCommand none

# RSA Logins: helpful links that match your preferred HostName below.
# You will need to make sure you are authenticated to the endpoint
# in your datacenter, otherwise you won't be able to connect.
#  https://auth.${WORK_DC}.gateway.rackspace.com/netaccess/connstatus.html

Host bastion
    Hostname ${WORK_BASTION_HOST}
    ForwardAgent yes
    ForwardX11Trusted yes
    ProxyCommand none
    User ${USERNAME}
    ControlMaster auto
    ControlPath ~/.ssh/master-%r@%h:%p
    TCPKeepAlive yes
    ServerAliveInterval 300
    #
    # Most techs run a terminal permanently open to the bastion
    # which serves as the MUX socket; if you do not do this,
    # uncomment the below to have the first MUX created tossed
    # into the background instead (man ssh -> "-O ctl_cmd")
    # ControlPersist 10h

Host *
    ProxyCommand ssh -A bastion 'nc %h %p'
    ForwardX11Trusted yes
    GSSAPIAuthentication no
    StrictHostKeyChecking no
    VerifyHostKeyDNS no
    HashKnownHosts no
    TCPKeepAlive yes
    ServerAliveInterval 300

EOF


pushd $SSH_DIR > /dev/null
echo "----> Setting config to '$DESIRED' in $SSH_DIR"
cp -f config-$DESIRED config
popd > /dev/null

echo "----> Resetting SSH Agent list"
case $DESIRED in
home)
    SSH_KEY_LIST="$HOME/.ssh/id_rsa ${WORK_BASTION_KEY}"
    unset GITHUB_URL # For use with https://github.com/defunkt/gist
    ;;
work)
    SSH_KEY_LIST="$HOME/.ssh/id_rsa ${WORK_BASTION_KEY}"
    # export GITHUB_URL=https://github.rackspace.com/ # For use with https://github.com/defunkt/gist
esac
ssh-add -D
ssh-add $SSH_KEY_LIST
echo "  ==> Identities:"
ssh-add -l -E md5
echo "----> Done"


