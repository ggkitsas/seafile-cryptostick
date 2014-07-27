#!/bin/sh

cd ~/Seafile
#rm -rf *

cd ~/Seafile/Seafile/.seafile-data/storage
cd blocks/ && rm -rf * && cd -
cd commits/ && rm -rf * && cd -
cd fs/ && rm -rf *

cd ~/Seafile/Seafile/.seafile-data
sqlite3 repo.db "delete from Repo where 1=1;"
sqlite3 repo.db "delete from RepoBranch where 1=1;"
sqlite3 repo.db "delete from RepoKeys where 1=1;"
sqlite3 repo.db "delete from RepoProperty where 1=1;"
sqlite3 branch.db "delete from Branch where 1=1;"
sqlite3 clone.db "delete from CloneTasks where 1=1;"
sqlite3 clone.db "delete from CloneVersionInfo where 1=1;"
sqlite3 clone.db "delete from CloneEncInfo where 1=1;"
