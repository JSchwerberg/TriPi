echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo



echo "$(tput setaf 1)01010100 01110010 01101001 01010000 01101001 00110010 00101110 00110000"
echo "$(tput setaf 2)                 _______     _  _____  _   ___      ___  "
echo "                |__   __|   (_)|  __ \(_) |__ \    / _ \ "
echo "                   | | _ __  _ | |__) |_     ) |  | | | |"
echo "                   | || '__|| ||  ___/| |   / /   | | | |"
echo "                   | || |   | || |    | |  / /_  _| |_| |"
echo "                   |_||_|   |_||_|    |_| |____|(_)\___/ "
echo                                             
echo "$(tput setaf 1)01010100 01110010 01101001 01010000 01101001 00110010 00101110 00110000"
echo
echo
echo



# RETROPIE PROFILE START
# MOTD courtesy of http://blog.petrockblock.com/forums/topic/retropie-mushroom-motd/#post-3965

function retropie_welcome() {
    local upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
    local secs=$((upSeconds%60))
    local mins=$((upSeconds/60%60))
    local hours=$((upSeconds/3600%24))
    local days=$((upSeconds/86400))
    local UPTIME=$(printf "%d days, %02dh%02dm%02ds" "$days" "$hours" "$mins" "$secs")

    # calculate rough CPU and GPU temperatures:
    local cpuTempC
    local cpuTempF
    local gpuTempC
    local gpuTempF
    if [[ -f "/sys/class/thermal/thermal_zone0/temp" ]]; then
        cpuTempC=$(($(cat /sys/class/thermal/thermal_zone0/temp)/1000)) && cpuTempF=$((cpuTempC*9/5+32))
    fi

    if [[ -f "/opt/vc/bin/vcgencmd" ]]; then
        if gpuTempC=$(/opt/vc/bin/vcgencmd measure_temp); then
            gpuTempC=${gpuTempC:5:2}
            gpuTempF=$((gpuTempC*9/5+32))
        else
            gpuTempC=""
        fi
    fi

    local df_out=()
    local line
    while read line; do
        df_out+=("$line")
    done < <(df -h /)

echo "$(tput setaf 2)
   .~~.   .~~. $(tput setaf 1)   $(date +"%A, %e %B %Y, %r")$(tput setaf 2)
  '. \ ' ' / .'   
   .~ .~~~..~.    $(uname -srmo)$(tput setaf 1)
  : .~.'~'.~. :   $(tput setaf 2)${df_out[0]}$(tput setaf 1)
 ~ (   ) (   ) ~  $(tput setaf 2)${df_out[1]}$(tput setaf 1)
( : '~'.~.'~' : ) $(tput setaf 2)Uptime.............: ${UPTIME}$(tput setaf 1)
 ~ .~       ~. ~  $(tput setaf 2)Memory.............: $(grep MemFree /proc/meminfo | awk {'print $2'})kB (Free) / $(grep MemTotal /proc/meminfo | awk {'print $2'})kB (Total)$(tput setaf 7)
  (  $(tput setaf 4) |   | $(tput setaf 7)  )  $(tput setaf 2) Running Processes..: $(ps ax | wc -l | tr -d " ")$(tput setaf 7)
  '~         ~'  $(tput setaf 2) IP Address.........: $(ip route get 8.8.8.8 2>/dev/null | head -1 | cut -d' ' -f8) $(tput setaf 7)
    *--~-~--*    $(tput setaf 2) Temperature........: CPU: $cpuTempC°C/$cpuTempF°F GPU: $gpuTempC°C/$gpuTempF°F

                 $(tput setaf 1) MOTD courtesy of: http://www.petrockblock.com

$(tput sgr0)"
}

retropie_welcome

# RETROPIE PROFILE END


sudo chmod 777 /dev/uinput

(sleep .1)

xboxdrv --trigger-as-button --wid 0 --led 10 --detach-kernel-driver --ui-buttonmap RB=exec:/home/pi/emu.sh --ui-buttonmap LB=exec:/home/pi/kodi.sh --ui-buttonmap GUIDE=exec:/home/pi/killswitch.sh --deadzone 4000 --quiet --silent & sleep 1

echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo "[32mHello, Dr. Light...(B[m"
echo
(sleep .1)

export PS1="\[\e[31m\]\u\[\e[m\]\[\e[36m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]: "
