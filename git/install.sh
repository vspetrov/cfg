#!/bin/sh
echo "Installing git config..."
workdir=$( cd "$( dirname "$0" )" && pwd )
echo "WORKDIR: $workdir"
mergetool_path=$workdir/install/mergetool.sh
mkdir -p install
cp mergetool.sh install
cp gitconfig install
rm ~/.gitconfig
ln -s $workdir/install/gitconfig ~/.gitconfig
ln -s $workdir/install/mergetool.sh ~/.mergetool
echo "Finished."
