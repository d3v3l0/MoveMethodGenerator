#!/usr/bin/env bash

if [ $# -ne "2" ]; then
    echo "usage: methods-mover <path to project> <path to csv files folder>"
    exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )" # from https://stackoverflow.com/a/246128
if uname -s | grep -iq cygwin ; then
    DIR=$(cygpath -w "$DIR")
    PWD=$(cygpath -w "$PWD")
fi

"$DIR/gradlew" --console=plain -p "$DIR" runMethodsMover -PprojectFolder="$PWD/$1" -PcsvFilesDir="$PWD/$2"
