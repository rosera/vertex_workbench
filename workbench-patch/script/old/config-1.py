# pylint: disable=anomalous-backslash-in-string, line-too-long, undefined-variable
c.NotebookApp.open_browser = False
c.ServerApp.token = ""
c.ServerApp.password = ""
c.ServerApp.port = 8080
c.ServerApp.ip = "*"
c.ServerApp.allow_origin_pat = "(^https://8080-dot-[0-9]+-dot-devshell\.appspot\.com$)|(^https://colab\.(?:sandbox|research)\.google\.com$)|(^(https?://)?[0-9a-z\-]+\.[0-9a-z\-]+\.cloudshell\.dev$)|(^(https?://)ssh\.cloud\.google\.com/devshell$)|(^(https?://)?[0-9a-z]+-[-0-9a-z]*.a.run.app)"

c.ServerApp.allow_remote_access = True
# pylint: enable=anomalous-backslash-in-string, line-too-long, undefined-variable
