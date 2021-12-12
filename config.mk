# dmenu version
VERSION = 5.0

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

# Default X11INC and X11LIB dirs
#X11INC = /usr/X11R6/include
#X11LIB = /usr/X11R6/lib

# Modified X11INC and X11LIB dirs to work on FreeBSD
X11INC = /usr/local/include
X11LIB = /usr/local/lib

# Xinerama, comment if you don't want it
XINERAMALIBS  = -lXinerama
XINERAMAFLAGS = -DXINERAMA

# freetype
FREETYPELIBS = -lfontconfig -lXft
# Default FREETYPEINC dir
#FREETYPEINC = /usr/include/freetype2
# Modified FREETYPEINC dir to work on FreeBSD
FREETYPEINC = /usr/local/include/freetype2
# OpenBSD (uncomment)
#FREETYPEINC = $(X11INC)/freetype2

# includes and libs
INCS = -I$(X11INC) -I$(FREETYPEINC)
LIBS = -L$(X11LIB) -lX11 -lXrender $(XINERAMALIBS) $(FREETYPELIBS)

# flags
CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700 -D_POSIX_C_SOURCE=200809L -DVERSION=\"$(VERSION)\" $(XINERAMAFLAGS)
CFLAGS   = -std=c99 -pedantic -Wall -Os $(INCS) $(CPPFLAGS)
LDFLAGS  = $(LIBS)

# compiler and linker
CC = cc
