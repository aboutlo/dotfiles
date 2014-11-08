#!/bin/sh
# unload SDXC driver aka unmount
sudo kextunload -b com.apple.driver.AppleSDXC

# load SDXC driver aka mount SDXC
sudo kextload -b com.apple.driver.AppleSDXC