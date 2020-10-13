# These are useful aliases when dealing with docker containers
# Some of these can be turned into functions
# ear() { echo "$@"; $@; }
if [ -z ${DOCKER_SOCKET+"D"} ]; then export DOCKER_SOCKET="/var/run/docker.sock"; fi
alias d="docker"
alias dr="d run"
alias drit="dr -it"
alias drrmit="dr --rm -it"
alias drvrmit='dr -v $DOCKER_SOCKET:/var/run/docker.sock --rm -it'
alias drvn='dr --network host -v $DOCKER_SOCKET:/var/run/docker.sock --rm -it'
alias dp='docker pull'
alias di="d image"
alias dils="di ls"
alias dip="di prune"
alias dc="d container"
alias dcls="dc ls"
alias dclsa="dcls -a"
alias dcp="dc prune"
alias dv="d volume"
alias dvls="dv ls"
alias dvp="dv prune"
alias dprune="dip; dcp; dvp"
alias dprunef="dip -f; dcp -f; dvp -f"
alias deit="docker exec -it"
