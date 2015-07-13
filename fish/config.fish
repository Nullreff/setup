set PATH ~/bin $PATH
set PATH /opt/vagrant/bin $PATH
set PATH ~/.local/share/node/bin $PATH

set fish_greeting ""
setenv EDITOR vim

function update
    sudo apt-get update
    sudo apt-get dist-upgrade -y
    sudo apt-get autoremove -y
    sudo apt-get clean
end

function format-json
    python -mjson.tool
end

alias ls=ls++
