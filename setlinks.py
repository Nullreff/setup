from os      import symlink
from os.path import islink, expanduser, exists
from shutil  import move

configs = ["vimrc", "xmonad", "xmobarrc", "gitconfig", "gitignore", "conkyrc", "lua"]
home = expanduser("~")

for config in configs:
    home_file = home + "/." + config
    config_file = home + "/.config/" + config

    if islink(home_file):
        print config + ": Already linked"
    elif exists(home_file):
        move(home_file, config_file)
        symlink(config_file, home_file)
        print config + ": Moved existing file to .config"
    elif exists(config_file):
        symlink(config_file, home_file)
        print config + ": Set link to existing file in .config"
    else:
        print config + ": Couldn't find file"

