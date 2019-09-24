#!/bin/bash

read -p 'Enter username:' USER_NAME

read -p 'Enter person info:' COMMENT

useradd -c "${COMMENT}" -m ${USER_NAME}

PWD=$(date +%s%N | sha256sum | head -c6 )

SPECIAL_CHAR=$(echo '!@#$%^&*()_+=' | fold -w2 | shuf | head -c2)

PWD=$(echo "${PWD}${SPECIAL_CHAR}" )
PWD=$(echo ${PWD} | fold -w1 |shuf|tr -d '\n')

echo ${USER_NAME}:${PWD}|chpasswd

echo "USER_NAME:${USER_NAME} PWD:${PWD}"
