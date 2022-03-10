#!/usr/bin/env bash

brew install jenv

# Shell: bash
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(jenv init -)"' >> ~/.bash_profile
echo 'jenv enable-plugin export' >> ~/.bash_profile
echo 'jenv enable-plugin maven' >> ~/.bash_profile


# Shell: zsh
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(jenv init -)"' >> ~/.zshrc
echo 'jenv enable-plugin export' >> ~/.zshrc
echo 'jenv enable-plugin maven' >> ~/.zshrc

brew install openjdk@8
brew install openjdk@11
brew install openjdk@17
brew install maven
brew install tomcat-native
brew install --cask springtoolsuite
brew install --cask intellij-idea-ce


sudo ln -sfn /usr/local/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
sudo ln -sfn /usr/local/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk

mv /tmp/ohmyzsh/plugins/jenv ~/.oh-my-zsh/plugins
