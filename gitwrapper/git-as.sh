#!/bin/bash
SSH_KEYFILE=$1 GIT_SSH=~/ssh-as.sh exec git "${@:2}"

