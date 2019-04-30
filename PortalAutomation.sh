# Portal Automation
# Pre-requisites:
#   a. The user should be connected to IMC to access PNP git hub.
#   b. SSH key should be established first between PNP account and github.

    portalDir='portal-dirs'
    portalThemeFullDir='portal-theme-hcl-full'
    portalThemeSmplDir='portal-theme-hcl-simple'

# Go to desktop
    cd ~/Desktop

# Delete portal directory, if present, and create new portal directory
    if [ -d "$portalDir" ]; then
        echo '--------------------------------------- PORTAL DIRECTORY - EXISTING'
        echo '---------------------------------------   ( Delete Portal Directory )'
        rm -rf "$portalDir"
        echo '---------------------------------------   ( Successful! )'
        echo '---------------------------------------'
    else
        echo '--------------------------------------- PORTAL DIRECTORY - NOT EXISTING'
    fi

# Create sub-directories of portal
    echo '---------------------------------------   ( Create Portal Directory with Webdav-Portal and Docker-Portal Sub-directories )'
    mkdir -p "$portalDir"/webdav-portal/themes
    mkdir -p "$portalDir"/docker-portal
    echo '---------------------------------------   ( Successful! )'
    echo '---------------------------------------'

# Clone Full and Simple Portal Theme from Git Hub 
    if [ -d "$portalDir"/webdav-portal/themes ]; then
        echo '--------------------------------------- WEBDAV-PORTAL SUB-DIRECTORY - EXISTING'
        cd "$portalDir"/webdav-portal/themes

        git clone git@git.cwp.pnp-hcl.com:Emmanuel-Palogan/portal-theme-hcl-full.git
        echo '---------------------------------------   ( Clone Full Portal Theme from GIT )'
        echo '---------------------------------------   ( Successful! )'
        echo '---------------------------------------'
        if [ -d "$portalThemeFullDir" ]; then
            echo '--------------------------------------- FULL PORTAL THEME SUB-DIRECTORY - EXISTING'
            echo '---------------------------------------   ( Rename portal-theme-hcl-full to Portal8.5 )'
            mv portal-theme-hcl-full/ Portal8.5/
            echo '---------------------------------------   ( Successful! )'
            echo '---------------------------------------'
        else    
            echo '--------------------------------------- FULL PORTAL THEME SUB-DIRECTORY - NOT EXISTING'
            exit
        fi

        git clone git@git.cwp.pnp-hcl.com:Emmanuel-Palogan/portal-theme-hcl-simple.git
        echo '---------------------------------------   ( Clone Simple Portal Theme from GIT )'
        echo '---------------------------------------   ( Successful! )'
        echo '---------------------------------------'
        if [ -d "$portalThemeSmplDir" ]; then
            echo '--------------------------------------- SIMPLE PORTAL THEME SUB-DIRECTORY - EXISTING'
            echo '---------------------------------------   ( Rename portal-theme-hcl-simple to Simple )'
            mv portal-theme-hcl-simple/ Simple/
            echo '---------------------------------------   ( Successful! )'
            echo '---------------------------------------'
        else
            echo '--------------------------------------- SIMPLE PORTAL THEME SUB-DIRECTORY - NOT EXISTING'
            exit
        fi

    else    
        echo '--------------------------------------- WEBDAV-PORTAL SUB-DIRECTORY - NOT EXISTING. PROGRAM WILL EXIT.'
        exit
    fi
    exit