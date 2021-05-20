# shellcheck shell=bash disable=SC1090

## Set Environment Variables
# -----------------------------------------------------------------------------

export BROWSER="firefox"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export TERMCMD="termite"

# merge program for pacdiff
export DIFFPROG="$EDITOR -d"

# find locally installed executables
export PATH="$PATH:$HOME/.local/bin:$HOME/.luarocks/bin"

# run askpass to enter password when not launched from a terminal
export SUDO_ASKPASS="/usr/lib/git-core/git-gui--askpass"
export SSH_ASKPASS="$SUDO_ASKPASS"

# get qt5 apps to use native gtk style (through qt5-styleplugins)
export QT_QPA_PLATFORMTHEME="gtk2"
export DESKTOP_SESSION="gnome"

# set path to configuration files for some programs
export WEECHAT_HOME="$HOME/.config/weechat"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc"
export PYTHONSTARTUP="$HOME/.config/python/config.py"

# force ptpython to use ansi colors everywhere
export PROMPT_TOOLKIT_COLOR_DEPTH="DEPTH_4_BIT"

# always use ripgrep with fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --smart-case --glob \
  '!{.git,node_modules}'"
# also use custom color configuration and keybindings
export FZF_DEFAULT_OPTS="--color 16,fg:15,bg:0,hl:11,fg+:15,bg+:237,hl+:11 \
  --color info:12,prompt:248,spinner:11,pointer:12,marker:208,header:241 \
  --color border:7 \
  --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all"

# VA-API acceleration on X11 for firefox
export MOZ_X11_EGL=1

# source environment variables which are not under version control
if [[ -r ~/.bash_profile.local ]]; then
  source ~/.bash_profile.local
fi

## Start session
# -----------------------------------------------------------------------------

if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
  exec systemd-cat startx -- -keeptty
elif [[ -r ~/.bashrc ]]; then
  source ~/.bashrc
fi
