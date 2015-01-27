# Linux and Shell
## Getting Around the Filesystem: Absolute and Relative Paths

1. Absolute path is used when we want to refer to some directory by specifying the path from the root (/), for instance '/usr/bin/bash' or '/Users/Some_user/Desktop/'. 
The relative path is the path we refer from the current directory we are located at, for instance 'cd some_folder/example/' changes directory to the sub directory some_folder/example/ . 

2. Navigating to my home directory (~) I reached '/Users/marioabreu' 

3. Navigating upward two directories cd ../.. I reached the root (/)


## Everything is a File

1. Folders, Hard drive, keyboard, processes.

2. We use file descriptors when we use pipes.

3. 4778
/usr/local/var/postgres
1422189486
5432
/tmp
localhost
  5432001   1179648

## Path and the Environment

1. env
env | grep EDITOR
The environment variable was not defined, so I used 'export EDITOR=vim' to define it.

2. echo $PATH

3. which ruby

## Transferring Files Between Boxes

1. scp mabreu.txt marioabreu@localhost:/tmp 

2. rm mabreu.txt
scp marioabreu@localhost:/tmp/mabreu.txt .


## Git. Just Git.

1. done.

2. git clone git@github.com:jmmastey/level_up_exercises.git

3. Did this currently on just_git branch.
