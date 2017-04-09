# About `mga-packages`

This directory is a mock replication of current Mageia's package SVN repo.
This directory exists to test the migration from the current SVN repo layout to the new [Fedora's dist-git layout](https://fedoraproject.org/wiki/Dist_Git_Proposal).
The mapping between the current layout and the new dist-git layout is explained [on Mageia's bugzilla](https://bugs.mageia.org/show_bug.cgi?id=20351).
In particular, the maximal configuration would be the following:

```
<pkg>
  ├ cauldron      ← SVN packages/cauldron/
  ├ mga6          ← SVN packages/updates/6/
  ├ mga6-backport ← SVN packages/backports/6/
  ├ mga6-infra    ← SVN packages/updates/infra_6/
  ├ mga5          ← SVN packages/updates/5/
  ├ mga5-backport ← SVN packages/backports/5/
  ├ mga5-infra    ← SVN packages/updates/infra_5/
  ├ mga4          ← SVN packages/updates/4/
  ├ mga4-backport ← SVN packages/backports/4/
  ├ mga4-infra    ← SVN packages/updates/infra_4/
  ├ mga3          ← SVN packages/updates/3/
  ├ mga3-backport ← SVN packages/backports/3/
  ├ mga3-infra    ← SVN packages/updates/infra_3/
  ├ mga2          ← SVN packages/updates/2/
  ├ mga2-infra    ← SVN packages/updates/infra_2/
  ├ mga1          ← SVN packages/updates/1/
  ├ mga1-infra    ← SVN packages/updates/infra_1/
  └ misc          ← SVN packages/misc/<pkg>
```

where each directory at the right of the arrow will be transformed to the corresponding git branch at the left of the arrow.

`mga-packages/obselete` will get a special treatment with a git commit that suppresses everything and add a `dead.package` file on the `cauldron` branch.
The content of the `dead.package` file and commit message will be:

> Converted from packages/obsolete/ tree on ${current date}

## `mga-packages-old` and `mga-packages-old-with-manual-annoyances`

These two repos are old ones (dating back to Mageia 3) made by Colin Guthrie. 
`mga-packages-old-with-manual-annoyances` contains a few manual commits on top that emulate various problems that have been encountered (e.g. accidentally svn rm'ing the whole of the cauldron tree, so the skip-revisions support he added in
svn2git could be tested).

## Creating the fake repo

`create-dump.txt` contains a command that let us perform a partial dump of the SVN repo. I picked up a few packages in addition to Colin's original dump command which are:

* Bugzilla,
* NSS,
* RPM and
* Firefox.

`create-repo.sh` creates the actual SVN repo from the dump file.

Big thanks to Colin Guthrie for these tools and the instructions to create the fake SVN repo.