#!/usr/bin/env bash

# whoami
echo whoami: $(whoami)
echo ' '

# Install dev tools
echo Install dev tools
apt-get update && apt-get install -y htop
echo ' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
echo '  Done  '
echo ' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
