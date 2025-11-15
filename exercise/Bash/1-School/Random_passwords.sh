#!/bin/bash

PASSWORD=${RANDOM}
echo "${PASSWORD}${PASSWORD}${PASSWORD}"
PASSWORD=${date +%s%N}
echo "${PASSWORD}"
PASSWORD=${date +%s%N | sha256sum | head -c10}
echo "${PASSWORD}"

S_C1=${echo '!@$%&^*()_-+=' | fold -w1 | shuf | head -c1}
S_C2=${echo '!@$%&^*()_-+=' | fold -w1 | shuf | head -c1}

echo "${S_C1]${S_C2)${PASSWORD)${S_C2)${S_C1}"
