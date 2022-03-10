ADMINUSER=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ { print $3 }' )
HOMEBREW_GROUP=hbrew
USERS=$ADMINUSER,$1

xcode-select --install &
git clone git://github.com/altercation/solarized.git /Users/Shared/solarized &
git clone https://github.com/powerline/fonts.git /Users/Shared/powerline --depth=1 &

# Should be installed for each user
sh /Users/Shared/powerline/install.sh

dscl . create /Groups/$HOMEBREW_GROUP
dscl . create /Groups/$HOMEBREW_GROUP RealName "Brewers"
dscl . create /Groups/$HOMEBREW_GROUP passwd "*"
dscl . create /Groups/$HOMEBREW_GROUP gid 786

for user in ${USERS//,/ }
do
    echo "Adding $user to group $HOMEBREW_GROUP"
    dseditgroup -o edit -a $user -t user "hbrew" &

    #cd solarized
    #mkdir -p ~/.vim/colors
    #cp solarized.vim ~/.vim/colors/
done


/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sudo chgrp -R $HOMEBREW_GROUP $(brew --prefix)/*
sudo chmod -R g+w $(brew --prefix)/*

git clone https://github.com/ohmyzsh/ohmyzsh.git /tmp/ohmyzsh &
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mv /tmp/ohmyzsh/plugins/brew ~/.oh-my-zsh/plugins
mv /tmp/ohmyzsh/plugins/git ~/.oh-my-zsh/plugins
mv /tmp/ohmyzsh/plugins/macos ~/.oh-my-zsh/plugins
mv /tmp/ohmyzsh/plugins/dirhistory ~/.oh-my-zsh/plugins
mv /tmp/ohmyzsh/plugins/jsontools ~/.oh-my-zsh/plugins

sudo -u $ADMINUSER sh 'brew.sh'
sudo -u $ADMINUSER sh 'java.sh'
sudo -u $ADMINUSER sh 'containerization.sh'
