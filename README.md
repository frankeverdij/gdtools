# Scripts for building packages with IRIX

This is a collection of scripts i use on my IRIX build machines for making dual mips3/mps4 packages under the */usr/nekoware* directory

## cksum.scr *filelist*

  Prints out a checksum for each file in *filelist*

## copymips.scr

  Takes *mips3/mipslist* and for each line copies the file from its location to the relative path *mips3/* by changing filepaths. Directories will be made on the fly


## diffsave.scr 

  Searches in the current directory recursively for files ending with *.save* or *.orig* and prints a **diff -ru** between the file and its counterpart without *.save* or *.orig* extension

## fileslinks.scr

  Prints all files and symbolic links in */usr/nekoware*. Used for determining which files are installed by comparing before and after **gmake install**

## difftofilelist.scr > *filelist*

  Makes a list of differences between two directory listings *before* and *after* from respectively before a **make install** and after a **make install** to unambiguously determine any files created by a certain package

## getmips.scr *filelist*

  Searches the filelist for ELF binaries and archives (with **file**) and displays them. If *mips3/mipslist* does not exist, it will be created

## dupmips.awk

  Use as: **cat old.idb | awk -f dupmips.awk > new.idb**

Complex awk script. it reads in a list of filenames from *mips3/mipslist* designating mips3 binaries. It then processes the input IDB file line-by-line for matching entries. If found, it duplicates the entry and adds for the existing entry a CPUARCH for mips4 systems and the duplicated entry a mips3 designation, pointing to the mips3 directory

## makecat.scr install/check/test

  A script which does **gmake clean** , **gmake** and **gmake install/check/test** and redirects each gmake output to a file

## harvest.scr

  This script reads the current nekoware install directory and copies the releasenotes and patches to a directory

## rm.scr *filelist*

  A simple (and save) remove script for files in a list
