set PATH ~/bin $PATH
set PATH ~/.local/bin $PATH
set PATH ~/.cargo/bin $PATH
set PATH /snap/bin $PATH
set PATH ~/.emacs.d/bin $PATH
set PATH ~/.local/share/miniconda3/bin $PATH

# Wayland fixes, disable if you're not using it
set GDK_BACKEND wayland

set fish_greeting ""
setenv EDITOR vim

function update
    sudo apt update
    sudo apt dist-upgrade -y
    sudo apt autoremove -y
    sudo apt clean
    sudo snap refresh
    snap refresh --beta --devmode anbox
    vim +BundleInstall +qall
    doom upgrade
end

function format-json
    python -mjson.tool
end

