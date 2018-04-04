#!/bin/bash
# =============================================================== #
#
#  This file is normally read by interactive shells only.
#+ Here is the place to define your aliases, functions and
#+ other interactive features like your prompt.
#
#  The majority of the code here assumes you are on a GNU
#+ system (most likely a Linux box) and is often based on code
#+ found on Usenet or Internet.
#
#  See for instance:
#  http://tldp.org/LDP/abs/html/index.html
#  http://www.caliban.org/bash
#  http://www.shelldorado.com/scripts/categories.html
#  http://www.dotfiles.org
#
#  The choice of colors was done for a shell with a dark background
#+ (white on black), and this is usually also suited for pure text-mode
#+ consoles (no X server available). If you use a white background,
#+ you'll have to do some other choices for readability.
#
# =============================================================== #

# -------------------------------------------------------------
# Source global definitions (if any)
# -------------------------------------------------------------
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
fi

# -------------------------------------------------------------
# Default path setup
# -------------------------------------------------------------
export PATH="/usr/local/opt/apr/bin:/usr/local/opt/openssl/bin:/usr/local/opt/curl/bin:/usr/local/opt/icu4c/bin:/usr/local/opt/icu4c/sbin:/usr/local/opt/libxml2/bin:/usr/local/opt/sqlite/bin:/usr/local/opt/tomcat@7/bin:$JAVA_HOME/bin:$M3_HOME/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
