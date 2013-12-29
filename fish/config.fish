set PATH ~/bin $PATH
set PATH /opt/vagrant/bin $PATH
set PATH ~/.local/share/node/bin $PATH

set fish_greeting ""
setenv EDITOR vim

function update
    sudo apt-get update
    sudo apt-get upgrade -y
end

function format-json
    python -mjson.tool
end

alias ls=ls++
