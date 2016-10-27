#!/bin/bash

target=$1

if [[ -n "$target" ]]; then
    cat ~/.ssh/id_rsa.pub | ssh $1 'cat >> ~/.ssh/authorized_keys'
else
    echo "argument error"
fi



