# =========================================================================
# =========================================================================
#
#	Dockerfile for
#	    Eclipse Oxygen IDE for JavaScript + git/html/xml/css/mylyn + ...
#		in a Debian docker container.
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 9.6.0-oxygen
# @copyright © 2018. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ewsdocker/debian-eclipse-javascript
# @subpackage Dockerfile
#
# =========================================================================
#
#	Copyright © 2018. EarthWalk Software
#	Licensed under the GNU General Public License, GPL-3.0-or-later.
#
#   This file is part of ewsdocker/debian-eclipse-javascript.
#
#   ewsdocker/debian-eclipse-javascript is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ewsdocker/debian-eclipse-javascript is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ewsdocker/debian-eclipse-javascript.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# =========================================================================
# =========================================================================
FROM ewsdocker/debian-openjre:9.6.0-gtk3

MAINTAINER Jay Wheeler <EarthWalkSoftware@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# =========================================================================
#
#   ARG_SOURCE <== url of the local source (http://alpine-nginx-pkgcache), 
#                   otherwise external source if not set.
#
# =========================================================================

ARG ARG_SOURCE

# =========================================================================
#
#     The following must be modified before running a build,
#         as there is no way to specify them in the build 
#         command.
#
# 	  Eclipse repository address
#
# =========================================================================

ENV ECLIPSE_RELEASE=oxygen 
ENV ECLIPSE_VERS=3a 
ENV ECLIPSE_IDE=javascript 
ENV ECLIPSE_PKG="eclipse-${ECLIPSE_IDE}-${ECLIPSE_RELEASE}-${ECLIPSE_VERS}-linux-gtk-x86_64.tar.gz" 
ENV ECLIPSE_DIR=eclipse 

#ENV ECLIPSE_HOST=http://alpine-nginx-pkgcache 
ENV ECLIPSE_HOST=${ARG_SOURCE:-"http://mirror.csclub.uwaterloo.ca/eclipse/technology/epp/downloads/release/${ECLIPSE_RELEASE}/${ECLIPSE_VERS}"}

ENV ECLIPSE_URL="${ECLIPSE_HOST}/${ECLIPSE_PKG}" 

# =========================================================================

ENV NODEJS_VERSION="setup_10.x"
ENV NODEJS_HOST="https://deb.nodesource.com"
ENV NODEJS_URL="${NODEJS_HOST}/${NODEJS_VERSION}"

# =========================================================================

ENV LMSBUILD_RELVER="9.6.0"
ENV LMSBUILD_VERSION="${LMSBUILD_RELVER}-${ECLIPSE_RELEASE}"
ENV LMSBUILD_NAME=debian-eclipse-${ECLIPSE_IDE} 
ENV LMSBUILD_REPO=ewsdocker 
ENV LMSBUILD_REGISTRY="" 

ENV LMSBUILD_PARENT="debian-openjre:9.6.0-gtk3"
ENV LMSBUILD_DOCKER="${LMSBUILD_REPO}/${LMSBUILD_NAME}:${LMSBUILD_VERSION}" 
ENV LMSBUILD_PACKAGE="${LMSBUILD_PARENT}, NodeJs ${NODEJS_VERSION}, eclipse-${ECLIPSE_IDE}-${ECLIPSE_RELEASE}-${ECLIPSE_VERS}"

# =========================================================================

RUN curl -sL https://deb.nodesource.com/${NODEJS_VERSION} | sudo -E bash - \
 && apt-get -y update \
 && apt-get -y upgrade \
 && apt-get -y install \
               build-essential \
               libwebkitgtk-3.0 \ 
               nodejs \
 && cd /usr/local/share \
 && wget -q ${ECLIPSE_URL} \
 && tar -xvf ${ECLIPSE_PKG} \
 && rm ${ECLIPSE_PKG} \
 && ln -s /usr/local/share/${ECLIPSE_DIR}/eclipse /usr/bin/eclipse \
 && apt-get clean all \
 && printf "${LMSBUILD_DOCKER} (${LMSBUILD_PACKAGE}), %s @ %s\n" `date '+%Y-%m-%d'` `date '+%H:%M:%S'` >> /etc/ewsdocker-builds.txt 

# =========================================================================

COPY scripts/. /

RUN chmod +x /usr/bin/lms/* \
 && chmod 775 /usr/local/bin/* \
 && chmod 600 /usr/local/share/applications/debian-eclipse-javascript-${LMSBUILD_VERSION}.desktop 

# =========================================================================

VOLUME /library
VOLUME /source
VOLUME /userbin
VOLUME /workspace

WORKDIR /workspace

# =========================================================================

ENTRYPOINT ["/my_init", "--quiet"]
CMD ["/usr/bin/eclipse"]
