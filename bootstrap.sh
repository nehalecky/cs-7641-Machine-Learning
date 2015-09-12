#!/bin/bash
set -e

# 0. Set parameters
## 0.1 Environment name and dependencies
conda_env_name='cs-CS7641-machine-learning'
dependencies='numpy scipy pandas scikit-learn seaborn pip ipython Jupyter'

# 0.2 Specify Miniconda version
# remote repo: https://repo.continuum.io/miniconda/
# Filename: Miniconda-3.16.0-Linux-x86_64.sh
# NOTE: most recent version: Miniconda-latest-Linux-x86_64.sh"
miniconda_version='3.16.0'
miniconda="Miniconda-$miniconda_version-Linux-x86_64.sh"
expectedHash="87620e37caf523325ae67889656bc987"

# 1. Update system
sudo apt-get update
#Install other dependencies (those that won't resolve)
#sudo apt-get install -y libsm6 libxrender1 libfontconfig1

# 2. Setup Miniconda Install
## 2.1 Define Miniconda install directory
echo "Working direcotry: $PWD"
if [ $# -eq 0 ]
    then
    echo "No path argument specified, setting install directory as working directory: $PWD."
    proj_dir=$PWD

else
    echo "Path argument specified, installing to: $1"
    proj_dir=$1
fi

## 2.2 Setup miniconda
cd $proj_dir
PATH_INSTALL_BIN_DIR="$proj_dir/vm/shared/bin"
PATH_CONDA_SCRIPT="$PATH_INSTALL_BIN_DIR/$miniconda"
echo "Defined miniconda script path: $PATH_CONDA_SCRIPT"

if [[ -f "$PATH_CONDA_SCRIPT" ]]; then
  echo "Found existing Miniconda script at: $PATH_CONDA_SCRIPT"
else
  echo "Downloading Miniconda script to: $PATH_CONDA_SCRIPT ..."
  wget http://repo.continuum.io/miniconda/$miniconda -P "$PATH_INSTALL_BIN_DIR"
  echo "Downloaded $miniconda!"
  ls -al $PATH_CONDA_SCRIPT
  chmod 755 $PATH_CONDA_SCRIPT
fi

# 2.3 #md5sum hash check of miniconda installer
md5Output=$(md5sum $PATH_CONDA_SCRIPT | awk '{print $1}')
if [ "$expectedHash" != "$md5Output" ]; then
    echo "Unexpected md5sum $md5Output for $miniconda"
    exit 1
fi

# 3. Install of Miniconda
## 3.1 Via bootstrap
PATH_CONDA="$proj_dir/miniconda-$miniconda_version"
if [[ ! -d $PATH_CONDA ]]; then
    #blow away old symlink / default miniconda install
    rm -rf "$proj_dir/miniconda"
    # Install Miniconda
    echo "Installing $miniconda to $PATH_CONDA..."
    bash $PATH_CONDA_SCRIPT -b -p $PATH_CONDA -f
    chmod 755 $PATH_CONDA
    #create symlink
    ln -sf $PATH_CONDA "$proj_dir/miniconda"
    chmod 755 "$proj_dir/miniconda"
else
    echo "Existing directory at path: $PATH_CONDA, skipping install!"
fi

# 3.2 Update PATH and conda...
echo "Setting environment variables..."
PATH_CONDA_BIN="$PATH_CONDA/bin"
export PATH="$PATH_CONDA_BIN:$PATH"
echo "Updated PATH: $PATH"
echo "And also HOME: $HOME"
hash -r
which conda
conda config --set always_yes yes --set changeps1 no
source ~/.bashrc

echo "Updating conda..."
conda update -q conda
# Useful for debugging any issues with conda
conda info -a

# 3.3 Update .bashrc profile to source activate the conda environment
# at shell start.
if grep -ir "PATH_CONDA_BIN=" /$HOME/.bashrc
    then
    echo "Path environment varabible definition found in .bashrc, skipping..."
else
    echo "Adding path definintion to .bashrc..."
    echo "export PATH_CONDA_BIN=$PATH_CONDA_BIN"        >> $HOME/.bashrc
    sudo echo 'export PATH=$PATH:$PATH_CONDA_BIN'       >> $HOME/.bashrc
    sudo echo "source activate $conda_env_name"         >> $HOME/.bashrc
fi
echo "Updated PATH: $PATH"


# 4. Install dependencies via conda
echo "Installing dependencies for $conda_env_name..."
echo "Installing set dependencies: $dependencies"
conda create -q -n $conda_env_name $dependencies || true
echo "Activating $conda_env_name environment..."
source activate $conda_env_name


# Install unittest dependencies
#conda install nose coverage mock

# Install documentation build dependencies
#sudo apt-get install -y pandoc make
#conda install ipython=3.2.1 ipython-notebook sphinx numpydoc jsonschema
#pip install sphinx_rtd_theme sphinx_bootstrap_theme testfixtures mistune
