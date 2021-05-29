set PATH ~/bin $PATH
set PATH ~/.cargo/bin $PATH
set PATH /snap/bin $PATH

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

