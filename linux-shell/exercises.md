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


## Managing File Permissions

1. `touch /tmp/mabreu.txt` - it creates a file named `mabreu.txt` in `tmp/` directory. The file's permissions are `-rw-r--r--` which means that the users and the group of the owner have permissions to read, and the owner have permissions to read and write the file.

2. `sudo chown root /tmp/mabreu.txt`

3. `chmod 0555 /tmp/mabreu.txt`

4. `chmod -w /tmp/mabreu.txt`

## Why You Shouldn't Use Sudo 

1. `sudo su` which give root access and it does not ask for password again in the current session.

2. We can have problems if we force to change a files/directory permissions, specially if the it is read-only for safety reasons.


## Finding, pausing and killing processes

1. It's true, it never completes. I can see it using the top command. To kill the process, I just ran the `kill -9 <pid>`.

2. When we append the `&`, the process keep running, but on the background. 

3. Using the `fg` we can bring back the last job that we put on the background.

4. I used the PS command to find the PID of ruby script. (if I use the `top` command i can also find it).

5. To kill a process, check the PID with ps -aux (in my case it was `ps-x`, is this an alias from dotfiles?) to check the PID. After that I used `kill -9 <PID>`. 


## Starting and Stopping Services
- I have jumped this one, as indicated. 


## Monitoring Production Hardware
- I have jumped this one, as indicated. 

## What's a Port and How to Find It

1. netstat -a 

2. I don't have a Linux VM to test this. 

3. Default values for :
  - ssh : 22
  - scp : 22
  - http : 80
  - https : 443
  - postgres : 5432

## Why We Use Web Proxies

1. The user makes a request to access a webpage, DNS translate the Domain name into a IP Address. The server responds to the request.

2. After the the client request (browser) the browser ask's a DNS Server to resolve de Domain Name into a IP. After that, the request passes for a ASM (application security manager) that determinates if the request is on the whitelist. If it is, then is send to a balance loader witch will send it to one of our web node. Our Web node has a nginx web server that receives the requestes and send it to one of our multiple puma webservers.
 

## Managing Server Time (NTP)

1. `sudo ntpdate 3.pt.pool.ntp.org` I can't make it work. 
the output was `28 Jan 00:55:03 ntpdate[99296]: the NTP socket is in use, exiting` then i tried to `killall -9 ntpd` and tried again, and nothing.

## Firewalls, iptables, and nmap
1. Can't execute `iptables` it returns `zsh: command not found: iptables`.

2. The whitelist has the known, this means when a application tries to execute, if is included on white list, it executes. The blacklist the the oposite, preventing an application to execute if it is on the blacklist. But, due to the variety and ever-increasing number of threats, its hard to maintain the blacklist updated.

3. -- I dont have nmap. I installed it through the `brew install nmap` but still does not execute. 




