#!/usr/bin/env ruby

require 'fileutils'

CONFIGS = %w(
  vimrc
  xmonad
  xmobarrc
  gitconfig
  gitignore
  gemrc
  railsrc
  ackrc
  ls++.conf
)

SOFTWARE = {
  'apt-get' => %w(
    xmonad
    xmobar
    trayer
    fish
    vim
    ruby
    git
  ),

  'cpan' => %w(
    App::Ack
  ),

  'gem' => %w(
    rake
    bundler
  )
}

# Link config files
CONFIGS.each do |config|
  home_file = File.expand_path("~/.#{config}")
  config_file = File.expand_path("~/.config/#{config}")

  if File.symlink?(home_file)
    puts "#{config}: Already linked"

  elsif File.exist?(home_file)
    FileUtils.move(home_file, config_file)
    File.symlink(config_file, home_file)
    puts "#{config}: Moved existing file to .config"

  elsif File.exist?(config_file)
    File.symlink(config_file, home_file)
    puts "#{config}: Set link to existing file in .config"

  else
    puts "#{config}: Couldn't find file at the path '#{home_file}'"
  end
end

# Install software
SOFTWARE.each do |installer, programs|
  system "sudo #{installer} install #{programs.join(' ')}"
end

# Install vim plugins
unless File.directory? File.expand_path('~/.vim/bundle/vundle')
  puts 'vim: Installing Vundle'
  `git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`
else
  puts 'vim: Vundle already installed'
end

puts 'vim: Installing plugins'
`vim +BundleInstall +qall`
