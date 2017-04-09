#!/bin/bash

BASEDIR=$(pwd)
DUMP=fake-repo.dump
MAXREV=4254
REPODIR=mga-packages
SVNPATH=file://$BASEDIR/$REPODIR

cd $BASEDIR

rm -rf $REPODIR
mkdir $REPODIR
svnadmin create $REPODIR
svn mkdir -m "Synthesise: Create cauldron folder" $SVNPATH/cauldron
svnadmin load -r 1:537 $BASEDIR/$REPODIR <$DUMP
svn mkdir -m "Synthesise: Create updates folder" $SVNPATH/updates
svn cp -m "Synthesise: Branch for updates: 1" $SVNPATH/cauldron@481 $SVNPATH/updates/1
svn cp -m "Synthesise: Branch for updates: infra_1" $SVNPATH/cauldron@481 $SVNPATH/updates/infra_1
svnadmin load -r 538:1907 $BASEDIR/$REPODIR <$DUMP
svn cp -m "Synthesise: Branch for updates: 2" $SVNPATH/cauldron $SVNPATH/updates/2
svnadmin load -r 1908:3194 $BASEDIR/$REPODIR <$DUMP
svn cp -m "Synthesise: Branch for updates: 3" $SVNPATH/cauldron $SVNPATH/updates/3
svnadmin load -r 3195:$MAXREV $BASEDIR/$REPODIR <$DUMP
