set PATH ~/bin $PATH
set PATH ~/.local/bin $PATH
set PATH ~/.cargo/bin $PATH
set PATH /snap/bin $PATH
set PATH ~/.emacs.d/bin $PATH

set fish_greeting ""
setenv EDITOR vim

function update
    sudo apt update
    sudo apt dist-upgrade -y
    sudo apt autoremove -y
    sudo apt clean
    sudo snap refresh
    vim +BundleInstall +qall
    doom upgrade
end

function format-json
    python -mjson.tool
end

