#!/bin/bash

# RenderTrust Bootstrap Script

# Print RenderTrust ASCII banner
echo ""
echo " ___  ___  ___  ___  ___  ___  ___  ___  ___  ___  ___  ___  ___  ___  "
echo "/   \/   \/   \/   \/   \/   \/   \/   \/   \/   \/   \/   \/   \ "
echo "|    | R | E | N | D | E | R | T | R | U | S | T |   |   |   |  "
echo "\___/\___/\___/\___/\___/\___/\___/\___/\___/\___/\___/\___/\___/\___/  "
echo ""
echo "Edge-AI Fabric for distributed compute"
echo ""

# Set up git remotes
git remote -v | grep origin > /dev/null

if [ $? -ne 0 ]; then
  echo "Setting up git remote..."
  git remote add origin https://github.com/cheddarfox/rendertrust.git
fi

# Launch Docker stack
echo "Launching Docker stack..."
# TODO: Add Docker compose command here

echo "RenderTrust bootstrap complete!"
echo ""
