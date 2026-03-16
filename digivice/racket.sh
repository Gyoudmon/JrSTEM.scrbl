#!/bin/zsh

export PLTHOME=/opt/PLTracket 

cd ~/Racket/digimon
git pull
${PLTHOME}/bin/raco wisemon -v

cd ~/Racket/graphics
git pull
${PLTHOME}/bin/raco wisemon -v
