#! /bin/bash
#
# Put this script in ~/bin/google-chrome for example, then create
# a symlink to start using it, for example:
#
#   shell% cd bin
#   shell% ln -s google-chrome google-chrome-test
#   shell% ./google-chrome-test

# Try to locate Google Chrome
GOOGLE_CHROME=
if [ -x "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" ]
then
    GOOGLE_CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
fi
if [ -x "/Users/$USER/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" ]
then
    GOOGLE_CHROME="/Users/$USER/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
fi
if [ -z "${GOOGLE_CHROME}" ]
then
    echo "Could not locate the Google Chrome.app binary" >&2
    exit 1
fi

# Check if we are called by a symlink
PROFILE_NAME=$(basename "$0" | sed -e 's/^google-chrome-//')
if [ "${PROFILE_NAME}" = "google-chrome" ]; then
    cat <<EOF
Please create a symlink to this script to start using multiple
Google Chrome profiles, it should be a matter of executing 
something like:
    
    shell% ln -s $0 $0-name
Where "name" is the name of the new profile.
EOF
    exit 1
fi

# Profile directory
USER_DIR="/Users/${USER}/Library/Application Support/Google/Chrome-${PROFILE_NAME}"
echo "Using ${USER_DIR}"

# Execute Google Chrome (in the background)
exec "${GOOGLE_CHROME}" \
    --enable-udd-profiles \
    --user-data-dir="${USER_DIR}" 1>2 2>/dev/null &

