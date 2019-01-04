#!/usr/bin/bash

echo "I am $(whoami)."
sleep 1
echo "Let's change..."
su - stone
echo "Now I am $(whoami)"
exit
