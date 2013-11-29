#!/bin/sh
sudo apt-get install -y ack-grep
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep
