#!/bin/bash
#Import config
. .config
TMPDIR="/tmp/rt$(date +%s)"
INSTALLVERSION="v0.9.0"

if [ ! -d $INSTALLDIR ]
then
    mkdir $INSTALLDIR
fi
mkdir $TMPDIR
pushd $TMPDIR
git clone git@github.com:RadarRelay/rt.git
cd rt
git checkout $INSTALLVERSION
# Clean up git directory
rm -rf $TMPDIR/.git
mv $TMPDIR/rt/* $INSTALLDIR
ln -s $INSTALLDIR/rt $SYMLOC 
popd
