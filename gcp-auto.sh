#!/bin/bash

#########################################################################################################################
#Installing anaconda with the required packages
#########################################################################################################################
apt-get install zip unzip -y

#########################################################################################################################
#Installing anaconda with the required packages
#########################################################################################################################

wget "https://repo.continuum.io/archive/Anaconda3-2019.10-Linux-x86_64.sh" -O "Anaconda3-2019.10-Linux-x86_64.sh"
bash Anaconda3-2019.10-Linux-x86_64.sh -b
echo "export PATH=\"$HOME/anaconda3/bin:\$PATH\"" >> ~/.bashrc
export PATH="$HOME/anaconda3/bin:$PATH"
source ~/.bashrc
conda install -y bcolz
conda upgrade -y --all

#########################################################################################################################
#Create conda env
#########################################################################################################################
conda create -n argument python=3.6 -y
conda install -n argument pytorch==1.2.0 torchvision==0.4.0 cudatoolkit=10.0 -c pytorch -y
conda install -n argument  ipykernel scikit-learn -y
conda install nb_conda ipykernel -y
jupyter notebook --generate-config

echo "c = get_config()
c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 5000" >> ~/.jupyter/jupyter_notebook_config.py

#########################################################################################################################
#Create Pycharm sudo intepreter
#########################################################################################################################
echo "#!/bin/bash
sudo /home/woaibritneyspears/anaconda3/envs/argument/bin/python \"\$\@\"" >> ~/root-python.sh
chmod +x ~/root-python.sh


