#!/bin/sh

# Startup Xvfb
Xvfb -ac :99 -screen 0 1280x1024x16 > /dev/null 2>&1 &

# Export some variables
export DISPLAY=:99.0
# export PUPPETEER_EXEC_PATH="google-chrome-stable"

# sudo chown -R pptruser:pptruser /github/workspace
mkdir -p /github/home
sh -c "sudo chown -R pptruser:pptruser /github"
sh -c "sudo chmod -R pptruser:pptruser /github"


echo "Inside The Docker Container"

# Run commands
cmd=$@
echo "Running '$cmd'!"
if $cmd; then
    # no op
    echo "Successfully ran '$cmd'"
else
    exit_code=$?
    echo "Failure running '$cmd', exited with $exit_code"
    exit $exit_code
fi
