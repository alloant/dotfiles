function exa --description "Exa with colors"
    exa --color=auto --group-directories-first $argv
end

function ls --description "Equivalent to exa"
   exa $argv
end

function la --description "Show all"
    exa -a $argv
end

function l --description "Exa con list"
    exa -l $argv
end

function l. --description "Only hidden"
    exa -ad .* $argv
end

function ll --description "List and all"
    exa -la $argv
end

function find --description "Replace find with fd always"
    fd $argv
end

function grep --description ""
    grep --color=auto $argv
end

function egrep --description ""
    egrep --color=auto $argv
end

function fgrep --description ""
    fgrep --color=auto $argv
end

function cls --description ""
    clear
end

function pt --description ""
    pstree -aps $argv
end

function fid --description "Recursively find a pattern in a directory (eg. fid stdio someprojectdir)"
    grep -Irn $argv
end

function mnt --description ""
    udisksctl mount -b $argv
end

function pk --description ""
    pkill $argv
end

function reboot --description ""
    doas reboot
end

function poweroff --description ""
    doas poweroff
end
