#!/bin/bash
echo "Installing git config..."
workdir=$( cd "$( dirname "$0" )" && pwd )
mergetool_path=$workdir/mergetool.sh
username=`whoami`
homedir=`echo ~$username`
cp -v $workdir/.gitconfig $homedir/.gitconfig
perl -i -pe "s/\@MERGE\_TOOL\@/$mergetool_path" $homedir/.gitconfig

echo "Finished.."
