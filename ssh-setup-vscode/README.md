# Varga-Group-Video-Tutorials

How to set up VS-CODE for ssh into the cluster so that you don't have to do everything through the terminal.

https://youtube.com/playlist?list=PLlJvCT0DQtXvL1J9yYt-dgqiRUJ5-pXZM&si=N7Ak43IwvalQgpLb

UPDATE: try the latest version of the extension. if that doesn't work then revert to old version. Try this for the config file if you experience bugs. REPLACE EACH ' USERNAME ' WITH YOUR ACCOUNT NAME:

# kalman-all-series1

Host 129.59.116.196
HostName 129.59.116.196
ForwardX11 yes
User USERNAME

# cmtq12

Host 10.8.132.84
HostName 10.8.132.84
User USERNAME
ForwardX11 yes
ProxyJump 129.59.116.196
HostkeyAlgorithms +ssh-rsa
PubkeyAcceptedAlgorithms +ssh-rsa

# nano.phy

Host nano.phy
HostName nano.phy
User USERNAME
ForwardX11 yes
ProxyJump 129.59.116.196
HostkeyAlgorithms +ssh-rsa
PubkeyAcceptedAlgorithms +ssh-rsa
