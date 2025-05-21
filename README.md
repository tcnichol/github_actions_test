# github_actions_test

The purpose of this repository is to serve as an example for github actions. The github actions 
performed will be

1. Pushing a new docker image with tag 'latest' to docker hub when a new commit to main is made
2. Pushing a new docker image with a tag for each release, and updating a remote server. 

This will require setting up a number of secrets in the github repository. They are as follows

DOCKER_HUB_USERNAME (your docker hub username)

DOCKER_HUB_TOKEN (your docker hub token)

DOCKER_COMPOSE_DIR (the directory where your docker compose file is located on the server)

Then there are the following

SSH_HOST (the server host)

SSH_USER (username to connect to the server)

SSH_KEY (the private key to connect to the server)

Here are instructions to setup the private key. 

On your laptop, run the following command to generate an ssh key. This key will have no passphrase.

`ssh-keygen -t ed25519 -f ~/.ssh/github-actions-deploy -N ""`

Next, copy the public key to the server.

`# Append the public key (replace with YOUR_KEY from previous step)
echo "PASTE_PUBLIC_KEY_HERE" >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys`

Next, copy the key to github secrets. Paste the entire private key (including -----BEGIN OPENSSH PRIVATE KEY-----

For this repository, if you make a new release on github, it will build a new image tagged with the 
release version, and it will push the image to docker hub. It will also update the server with the new image by signing
in using ssh, changing the environment variable for the version, and running the docker compose command to pull the new image.