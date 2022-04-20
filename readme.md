# Introduction
The machines in the labs can be a pain in the ass to work with sometimes especially with broken gcc complier, no package manager, and chsh not working. This script tries to side step the problem with homebrew, which can install packages in user space. It also comes with some (opinionated) niceties like oh-my-zsh, syntax highlighting and auto completion, which I find very useful in my daily lives. 

# Installation
1. Clone this repo
```bash 
$ git clone https://github.com/de0ch/sta-setup.git
```
2. Run the setup script
```bash 
$ sta-setup/setup.sh
```

# Troubleshooting
1. Build failure with `brew install`
The make complier on the lab machines is a bit broken. I haven't found a way to fix it yet, but you can workaround many build failures with `brew install --force-bottle` to use a "bottle" (pre-complied binary). Homebrew defaults to building from source because it is not installed in `/home/linuxbrew/.linuxbrew` (for which you don't have write permission). 

# Customization
The theme used is powerlevel10k, applied on oh-my-zsh. I used a font for p10k with the maximum font compatibility. If you want to customize the prompt look, run `p10k configure`. 

You can also read more about the two packages to learn more what they can do. 