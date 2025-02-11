#!/bin/bash -e
echo "STARTUP-SCRIPT: START"
export CONFIG_FILE="/home/jupyter/.jupyter/jupyter_notebook_config.py"  # Update path if necessary
export IP_LINE="c.NotebookApp.ip = '10.1.0.2'"  # Replace with your desired IP

## Amend ACL
## sudo -u jupyter sed -i '/c.ServerApp.ip /c\\nc.ServerApp.ip = \"*\"' /home/jupyter/.jupyter/jupyter_notebook_config.py
# Add access from any IP
sed -i "/c.NotebookApp.port/i $IP_LINE" "$CONFIG_FILE"
# Add Regex for Cloud Run
sudo -u jupyter sed -i '/c\.ServerApp\.allow_origin_pat =/s/$/|(^(https?:\/\/)?[0-9a-z]+-[\-0-9a-z]*\.a\.run\.app)"/' /home/jupyter/.jupyter/jupyter_notebook_config.py
# Add support for remote access
sudo -u jupyter sed -i '/c.ServerApp.allow_remote_access/c\\nc.ServerApp.allow_remote_access = True' /home/jupyter/.jupyter/jupyter_notebook_config.py
## Git clone the training-data-analyst repo as Jupyter user
sudo -u jupyter git clone https://github.com/GoogleCloudPlatform/training-data-analyst /home/jupyter/training-data-analyst
echo "STARTUP-SCRIPT: END"
