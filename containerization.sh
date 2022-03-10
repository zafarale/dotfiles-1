#!/usr/bin/env bash
brew install docker
brew install docker-compose
brew install dive

mv /tmp/ohmyzsh/plugins/docker ~/.oh-my-zsh/plugins &
mv /tmp/ohmyzsh/plugins/docker-compose ~/.oh-my-zsh/plugins &
