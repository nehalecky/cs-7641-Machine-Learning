#!/bin/bash
set -e

conda_env_name='cs-CS7641-machine-learning'
port='8009'
ip='0.0.0.0'

vagrant_home='/home/vagrant'

#cd $vagrant_home/assignments && $vagrant_home/miniconda/envs/$conda_env_name/bin/ipython notebook --port=$port --ip=$ip  --no-browser

cmd="cd $vagrant_home/assignments && $vagrant_home/miniconda/envs/$conda_env_name/bin/ipython notebook --port=$port --ip=$ip  --no-browser"
vagrant ssh -c "$cmd"

#"--config=/home/vagrant/vm/shared/notebook_config_energiscore.py"
#(sleep 3 && openUrl http://192.168.33.10:8888) &


