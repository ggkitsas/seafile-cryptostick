#!/bin/sh

cd ~/Seafile
#rm -rf *

cd ~/Seafile/Seafile/.seafile-data/storage
cd blocks/ && rm -rf * && cd -
cd commits/ && rm -rf * && cd -
cd fs/ && rm -rf *
