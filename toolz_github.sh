## My little library to handle github and it's api
## created by https://github.com/peedy2495

TOOLZ_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source $TOOLZ_DIR/toolz_misc.sh || echo "$TOOLZ_DIR/toolz_misc.sh not found!"

CheckCmdReqirements curl jq

if [ $? -ne 0 ]; then
    echo "Can't load this library due to lack of reqirements"
    echo "Please install reqired commands, first"
    return 1
fi

# Get total nuber of releases;
# CountReleases [repository]
GH_CountReleases() {
    curl -sL https://api.github.com/repos/$1/releases | jq '. | length'
}

# Get all release-versions;
# GetAllReleases [repository]
GH_GetAllReleases() {
    curl -sL https://api.github.com/repos/$1/releases | jq -r '.[].tag_name' | tr '\n' ' '
}


# Check, if a given release is available;
# returncode: 0=existing 1=failed;
# CheckRelease [repository] [releaseversion];
GH_CheckRelease() {
    RELEASES=$(GH_GetAllReleases $1 2>/dev/null)
    if [[ "${RELEASES[@]}" =~ "$2" ]]; then
        return 0
    else
        return 1
    fi
}

# Get latest version number;
# GetLatestVersion [repository]
GH_GetLatestVersion() {
    curl -sL https://api.github.com/repos/$1/releases/latest | jq -r '.tag_name'
}

# Get downloadurl of a filerelease; without releasenumber = latest;
# GetFileDownloadURL [repository] [filename] [releasenumber](optional)
GH_GetFileDownloadURL() {
    if [[ -z "$var" ]]; then
        VER="$(GH_GetLatestVersion $1)"
    else
        VER=$3
    fi

    # check for valid release
    GH_CheckRelease $1 $VER
    if [ $? -ne 0 ]; then
        echo "Release $1:$VER is not available!"
        return 1
    fi

    # check for valid file url
    URL="https://github.com/$1/releases/download/$VER/$2"
    curl -o/dev/null -sfI "$URL"
    if [ $? -ne 0 ]; then
        echo "File not found in $URL"
        return 1
    fi

    # ...everything is fine ... eat this! ;-)
    echo $URL
}