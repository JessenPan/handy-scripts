#!/bin/bash

orignExt="$1"

ll *.html|awk '{print $9}'|awk -F '.' '{print $1}'|xargs -I {} mv {}.html {}.vm
