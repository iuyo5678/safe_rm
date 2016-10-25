safe_rm
=======

## How to install?
1. clone the code
```bash
git clone https://github.com/iuyo5678/safe_rm.git
```
2. install
```bash
cd safe_rm
sh install_safe_rm.sh  install
```
3, restart the terminal

## How to use?
When you rm file. files are not deleted, but are saved in the path **~/.trash** .

You can as the as usual you delete file.  The file your deletes will back in **~/.trash/**.

Suppose you delete the file name is **delete_file**, 
then the backup file name is: **delete_file.1477383605**. The suffix is the timestamp

the back up file folder will be true delete at **2 AM** every day


## Uninstall

If you do not delete the installation file, execute the following command:
```bash  
sh  install_safe_rm.sh  uninstall
```
If you delete the installation file, you should delete comand manuly
1.  open the file 
 > "~/.bachrc" 
 
 and delete this line 
 > ". ~/.safe_rm.sh"
2. delete the file 
 
 > "~/.safe_rm.sh" 
 > "~/.trash"

You must perform the following operations regardless of whether or not you want to delete the installation file
```sh
crontab -e 
```
delete this line 
> 0 2 * * * /bin/rm -rf ~/.trash/*

