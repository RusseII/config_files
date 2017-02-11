# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
PATH=$PATH:/usr/lib64/openmpi/bin
PATH=$PATH:/usr/local/android-studio/bin
# User specific aliases and functions
#alias o="xdg-open"
alias cs="cd /home/rratcliffe/github/notes/comm_systems"
alias cn="cd /home/rratcliffe/github/notes/computer_networks"
alias c="cd /home/rratcliffe/github/notes/compilers"
alias dsp="cd /home/rratcliffe/github/notes/dsp" 
alias ds="cd /home/rratcliffe/github/notes/design_seminar" 
alias vlsi="cd /home/rratcliffe/github/notes/vlsi" 
alias get="cd /home/rratcliffe/github/notes;git pull; git add .; git commit -m 'Roos Commit'; git push;"
alias n="cd notes"
alias tg="/home/rratcliffe/junk/Telegram/Telegram >/dev/null 2>1 &"
alias g="google-chrome >/dev/null 2>1 &"
alias mute="amixer -D pulse sset Master mute"
alias unmute="amixer -D pulse sset Master unmute"
o(){
xdg-open $1 >/dev/null 2>1 &
}
