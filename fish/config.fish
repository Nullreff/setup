set PATH ~/bin $PATH
set PATH ~/.cargo/bin $PATH
set PATH /snap/bin $PATH

set fish_greeting ""
setenv EDITOR vim

function update
    sudo apt update
    sudo apt dist-upgrade -y
    sudo apt autoremove -y
    sudo apt clean
    sudo snap refresh
    ~/.emacs.d/bin/doom install
end

function format-json
    python -mjson.tool
end

