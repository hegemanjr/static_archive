#!/bin/bash

if [ "$1" != "" ]; then
    the_domain="$1"
else
    the_domain=example.com
fi

echo "Domain set to $the_domain"

wget \
    --mirror \
    --page-requisites \
    --html-extension \
    --level=20 \
    --no-clobber \
    --restrict-file-names=windows \
    --no-check-certificate \
    --convert-links \
    -e robots=off \
    -P . \
    --span-hosts \
    --domains=www.$the_domain,$the_domain \
    https://$the_domain/
    
$SHELL
