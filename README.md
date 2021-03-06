## ewsdocker/debian-eclipse-javascript:9.6.0  

**Eclipse IDE for JavaScript in a Debian-based Docker image.**  

Now with support branches for **Eclipse IDE Photon** and **Eclipse IDE Oxygen** versions.

____  

**A Docker pre-built image is available from [ewsdocker/debian-eclipse-javascript](https://hub.docker.com/r/ewsdocker/debian-eclipse-javascript).**  

____  

**NOTE**  
**ewsdocker/debian-eclipse-javascript** is designed to be used on a Linux system configured to support **Docker user namespaces** .  Refer to [ewsdocker Containers and Docker User Namespaces](https://github.com/ewsdocker/ewsdocker.github.io/wiki/UserNS-Overview) for an overview and information on running **ewsdocker/debian-eclipse-javascript** on a system not configured for **Docker user namespaces**.
____  

**Visit the [ewsdocker/debian-eclipse-javascript Wiki](https://github.com/ewsdocker/debian-eclipse-javascript/wiki/QuickStart) for complete documentation of this docker image.**  
____  

**Installing ewsdocker/debian-eclipse-javascript**  

The following scripts will download the the selected **ewsdocker/debian-eclipse-javascript** image, create a container, setup and populate the directory structures, create the run-time scripts, and install the application's desktop file(s).  

The _default_ values will install all directories and contents in the **docker host** user's home directory (refer to [Mapping docker host resources to the docker container](https://github.com/ewsdocker/debian-eclipse-javascript/wiki/QuickStart#mapping)),  

____  

**ewsdocker/debian-eclipse-javascript:latest**  
  
    docker run --rm \
               -v ${HOME}/bin:/userbin \
               -v ${HOME}/.local:/usrlocal \
               -e LMS_BASE="${HOME}/.local" \
               -e LMSBUILD_VERSION="latest" \
               -v ${HOME}/.config/docker:/conf \
               -v ${HOME}/.config/docker/debian-eclipse-javascript-latest:/root \
               --name=debian-eclipse-javascript-latest \
           ewsdocker/debian-eclipse-javascript lms-setup

____  
  
**ewsdocker/debian-eclipse-javascript:9.6.0-photon**  
  
    docker run --rm \
               -v ${HOME}/bin:/userbin \
               -v ${HOME}/.local:/usrlocal \
               -e LMS_BASE="${HOME}/.local" \
               -v ${HOME}/.config/docker:/conf \
               -v ${HOME}/.config/docker/debian-eclipse-javascript-9.6.0:/root \
               --name=debian-eclipse-javascript-9.6.0 \
           ewsdocker/debian-eclipse-javascript:9.6.0 lms-setup  

____  
  
**ewsdocker/debian-eclipse-javascript:9.6.0-oxygen**  
  
    docker run --rm \
               -v ${HOME}/bin:/userbin \
               -v ${HOME}/.local:/usrlocal \
               -e LMS_BASE="${HOME}/.local" \
               -v ${HOME}/.config/docker:/conf \
               -v ${HOME}/.config/docker/debian-eclipse-javascript-9.6.0-oxygen:/root \
               --name=debian-eclipse-javascript-9.6.0-oxygen \
           ewsdocker/debian-eclipse-javascript:9.6.0-oxygen lms-setup  

____  

Refer to [Mapping docker host resources to the docker container](https://github.com/ewsdocker/debian-eclipse-javascript/wiki/QuickStart#mapping) for a discussion of **lms-setup** and what it does.  

____  

**Running the installed scripts**

After running the above command script, and using the settings indicated, the docker host directories, mapped as shown in the above tables, will be configured as follows:

+ the executable scripts have been copied to **~/bin**;  
+ the application desktop file(s) have been copied to **~/.local/share/applications**; 
+ application desktops can be launched from any _task bar_ menu;  
+ the associated **debian-eclipse-javascript-"version"-"branch"** executable script (shown below) will be found in **~/.local/bin**, and _should_ be customized with proper local volume names;  

____  

**Execution scripts**  

____  

**ewsdocker/debian-eclipse-javascript:latest**
  
    docker run -e DISPLAY=unix${DISPLAY} \
               -v /tmp/.X11-unix:/tmp/.X11-unix \
               -v ${HOME}/.Xauthority:${HOME}/.Xauthority \
               -v /etc/localtime:/etc/localtime:ro \
               -v /media/dev-2018:/source \
               -v /media/dev-2018/git/ewsdocker:/project \
               -v /media/dev-2018/workspace/eclipse/javascript/latest:/workspace \
               -v ${HOME}/.config/docker/debian-eclipse-javascript-latest:/root \
               --name=debian-eclipse-javascript-latest \
           ewsdocker/debian-eclipse-javascript  

____  

**ewsdocker/debian-eclipse-javascript:9.6.0-photon**
  
    docker run -e DISPLAY=unix${DISPLAY} \
               -v /tmp/.X11-unix:/tmp/.X11-unix \
               -v ${HOME}/.Xauthority:${HOME}/.Xauthority \
               -v /etc/localtime:/etc/localtime:ro \
               -v ${HOME}/source:/source \
               -v /media/dev-2018/workspace/eclipse/javascript/photon/9.6.0:/workspace \
               -v ${HOME}/git/ewsdocker:/project \
               -v ${HOME}/.config/docker/debian-eclipse-javascript-9.6.0-photon:/root \
               --name=debian-eclipse-javascript-9.6.0-photon \
          ewsdocker/debian-eclipse-javascript:9.6.0-photon  

____  

**ewsdocker/debian-eclipse-javascript:9.6.0-oxygen**
  
    docker run -e DISPLAY=unix${DISPLAY} \
               -v /tmp/.X11-unix:/tmp/.X11-unix \
               -v ${HOME}/.Xauthority:${HOME}/.Xauthority \
               -v /etc/localtime:/etc/localtime:ro \
               -v ${HOME}/source:/source \
               -v /media/dev-2018/workspace/eclipse/javascript/oxygen/9.6.0:/workspace \
               -v ${HOME}/git/ewsdocker:/project \
               -v ${HOME}/.config/docker/debian-eclipse-javascript-9.6.0-oxygen:/root \
               --name=debian-eclipse-javascript-9.6.0-oxygen \
           ewsdocker/debian-eclipse-javascript:9.6.0-oxygen  

____  
Refer to [Mapping docker host resources to the docker container](https://github.com/ewsdocker/debian-eclipse-javascript/wiki/QuickStart#mapping) for a discussion of customizing the executable scripts..  

____  

**Regarding edge and edge-oxygen**  

For the very brave, if an _edge_ tag is available, these instructions will download, rename and install the _edge_ version.  Good luck.  

____  

**ewsdocker/debian-eclipse-javascript:edge**  


**edge** is the development tag for the **9.6.1** release tag.

    docker pull ewsdocker/debian-eclipse-javascript:edge
    docker tag ewsdocker/debian-eclipse-javascript:edge ewsdocker/debian-eclipse-javascript:9.6.1
    docker run --rm \
               -v ${HOME}/bin:/userbin \
               -v ${HOME}/.local:/usrlocal \
               -e LMS_BASE="${HOME}/.local" \
               -v ${HOME}/.config/docker:/conf \
               -v ${HOME}/.config/docker/debian-eclipse-javascript-9.6.1-photon:/root \
               --name=debian-eclipse-javascript-9.6.1-photon \
           ewsdocker/debian-eclipse-javascript:9.6.1-photon lms-setup  

optional step:

    docker rmi ewsdocker/debian-eclipse-javascript:edge  

To create and run the container, run **Eclipse Photon JavaScript (9.6.1)** from the _Programming_ category of any desktop menu. From the command-line, the following should work:

    ~/.local/bin/debian-eclipse-javascript-9.6.1  

____  

**ewsdocker/debian-eclipse-javascript:edge-oxygen**  


**edge-oxygen** is the development tag for the **9.6.1-oxygen** release tag.

    docker pull ewsdocker/debian-eclipse-javascript:edge-oxygen
    docker tag ewsdocker/debian-eclipse-javascript:edge-oxygen ewsdocker/debian-eclipse-javascript:9.6.1-oxygen
    docker run --rm \
               -v ${HOME}/bin:/userbin \
               -v ${HOME}/.local:/usrlocal \
               -e LMS_BASE="${HOME}/.local" \
               -v ${HOME}/.config/docker:/conf \
               -v ${HOME}/.config/docker/debian-eclipse-javascript-9.6.1-oxygen:/root \
               --name=debian-eclipse-javascript-9.6.1-oxygen \
           ewsdocker/debian-eclipse-javascript:9.6.1-oxygen lms-setup  

optional step:

    docker rmi ewsdocker/debian-eclipse-javascript:edge-oxygen  

To create and run the container, run **Eclipse PDT 9.6.1-oxygen** from the _Programming_ category of any desktop menu, or from the command-line, the following should work:

    ~/.local/bin/debian-eclipse-javascript:9.6.1-oxygen  

____  

**Persistence**  
In order to persist the Eclipse application state, a location on the docker _host_ must be provided to store the necessary information.  This can be accomplished with the following volume option in the run command:

    -v ${HOME}/.config/docker/debian-eclipse-javascript-"version"-"branch":/root  

Since the information is stored in the docker _container_ **/root** directory, this statement maps the user's **~/.config/docker/debian-eclipse-javascript-"version"-"branch"** docker _host_ directory to the **/root** directory in the docker _container_.  
____  
**Timestamps**  
It is important to keep the time and date on docker _host_ files that have been created and/or modified by the docker _containter_ synchronized with the docker _host_'s settings. This can be accomplished as follows:

    -v /etc/localtime:/etc/localtime:ro  

____  
**About the X11 Server / GUI Stack**  
The **ewsdocker/debian-eclipse-javascript** image is built on the [ewsdocker/debian-openjre](https://github.com/ewsdocker/debian-openjre/wiki) docker image, which is built on the [ewsdocker/debian-base-gui](https://github.com/ewsdocker/debian-base-gui/wiki) docker image. These two docker images provide the **X11-Server** stack and several **GUI** system elements.  The **X11-Server** stack is configured in the _docker run_ command as follows:

    docker run -e DISPLAY=unix${DISPLAY} \
               -v /tmp/.X11-unix:/tmp/.X11-unix \
               -v ${HOME}/.Xauthority:${HOME}/.Xauthority \

Since these options are _the same for all gui containers_, they should probably be the first options in the docker run command.  

____  

**Copyright © 2018, 2019. EarthWalk Software.**  
**Licensed under the GNU General Public License, GPL-3.0-or-later.**  

This file is part of **ewsdocker/debian-eclipse-javascript**.  

**ewsdocker/debian-eclipse-javascript** is free software: you can redistribute 
it and/or modify it under the terms of the GNU General Public License 
as published by the Free Software Foundation, either version 3 of the 
License, or (at your option) any later version.  

**ewsdocker/debian-eclipse-javascript** is distributed in the hope that it will 
be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.  

You should have received a copy of the GNU General Public License
along with **ewsdocker/debian-eclipse-javascript**.  If not, see 
<http://www.gnu.org/licenses/>.  

