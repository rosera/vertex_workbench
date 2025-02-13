# Vertex Workbench

To enable direct access to the Jupyter Workbench, update the following:

1. Amend the following settings:

```bash
c.ServerApp.port = 8080
c.ServerApp.ip = "10.1.0.2"
c.ServerApp.allow_origin_pat = "(^https://8080-dot-[0-9]+-dot-devshell\.appspot\.com$)|(^https://colab\.(?:sandbox|research)\.google\.com$)|(^(https?://)?[0-9a-z\-]+\.[0-9a-z\-]+\.cloudshell\.dev$)|(^(https?://)ssh\.cloud\.google\.com/devshell$)|(^(https?://)?[0-9a-z]+-[-0-9a-z]*.a.run.app)"
```

Note: The c.ServerApp.ip can be set to the virutal machine internal ip or as a wildcard.

## Create a Patch

Copy the jupyter config from the current notebook version.

1. Copy the original /home/jupyter/.jupyter/jupyter_notebook_config.py file
2. Copy the file to file `original-old.py`
3. Copy the file to file `original-new.py`
4. Update the file `original-new.py` with the required changes e.g.

```bash
c.ServerApp.ip = "10.1.0.2"
c.ServerApp.allow_origin_pat = "(^https://8080-dot-[0-9]+-dot-devshell\.appspot\.com$)|(^https://colab\.(?:sandbox|research)\.google\.com$)|(^(https?://)?[0-9a-z\-]+\.[0-9a-z\-]+\.cloudshell\.dev$)|(^(https?://)ssh\.cloud\.google\.com/devshell$)|(^(https?://)?[0-9a-z]+-[-0-9a-z]*.a.run.app)"
```

5. Create a patch file

```
diff -Naur script/original-old.py script/original-new.py > workbench.patch
```

6. Copy the patch to Cloud Storage
```
gsutil cp workbench.patch gs://spls/tlf-workbench/workbench.patch
``` 

## Apply the Patch 

Patch the Jupyter Workbench Config


```bash
gsutil cp gs://spls/tlf-workbench/workbench.patch /tmp/workbench.patch
sudo systemctl stop jupyter
patch jupyter_notebook_config.py < workbench.patch
sudo systemctl start jupyter
```
