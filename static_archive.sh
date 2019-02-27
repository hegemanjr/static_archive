#!/bin/bash

if [ "$1" != "" ]; then
    the_domain="$1"
else
    the_domain=example.com
fi

if [ "$2" != "" ]; then
    the_os="$2"
else
    the_os=windows
fi

echo "Domain set to $the_domain"
echo "Filename operating system set to $the_os"

wget \
    --mirror \
    --page-requisites \
    --html-extension \
    --level=20 \
    --no-clobber \
    --restrict-file-names=$the_os \
    --no-check-certificate \
    --convert-links \
    -e robots=off \
    -P . \
    --span-hosts \
    --domains=www.$the_domain,$the_domain \
    https://$the_domain/
    
$SHELL
