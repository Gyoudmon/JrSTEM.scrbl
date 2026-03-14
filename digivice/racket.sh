#!/bin/zsh

export PLTHOME=/opt/PLTracket 

cd ~/Racket/graphics
git pull
${PLTHOME}/bin/raco wisemon -v
