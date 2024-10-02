# Generated automatically from Makefile.in by configure.
# Makefile for GNU Spell.

# This file is part of GNU Spell.
# Copyright (C) 1996 Free Software Foundation, Inc.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

# Start of system configuration section.

SHELL = /bin/sh
srcdir = .
exec_prefix = ${prefix}
prefix = /usr/local
VERSION = 1.0

AUTOCONF = autoconf
CFLAGS = -g -O
CPPFLAGS = -I$(srcdir) 
DEFS = -DHAVE_CONFIG_H
DVIPS = dvips
INSTALL = ./install-sh -c
INSTALL_DATA = ${INSTALL} -m 644
INSTALL_PROGRAM = ${INSTALL}
LDFLAGS = 
LIBS = -lmalloc 
MAKEINFO = makeinfo
TEXI2DVI = texi2dvi

bindir = $(exec_prefix)/bin
infodir = $(prefix)/info

# End of system configuration section.

SRCS = spell.c str.c getopt.c getopt1.c
OBJS = spell.o str.o getopt.o getopt1.o

DISTFILES = $(SRCS) COPYING INSTALL Makefile.in README \
	config.h.in configure configure.in getopt.h install-sh \
	mkinstalldirs sample spell.info spell.texi version.texi str.h

all: spell info

.SUFFIXES:
.SUFFIXES: .c .o

.c.o:
	$(CC) $(CPPFLAGS) $(DEFS) $(CFLAGS) -c $< -o $@

spell: $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) $(LIBS) -o $@

install: installdirs install-info
	$(INSTALL_PROGRAM) spell $(bindir)/spell

install-info:
	$(INSTALL_DATA) $(srcdir)/spell.info $(infodir)/spell.info

uninstall:
	rm -f $(bindir)/spell $(infodir)/spell.info

clean:
	rm -f spell *.o core spell.dvi spell.ps version.texi *atac *trace

distclean: clean
	rm -f Makefile config.cache config.h config.log config.status

mostlyclean: clean
	rm -f *.aux *.cp *.cps *.dvi *.ps *.fn *.fns *.ky *.log *.pg *.toc
	rm -f *.tp *.vr

maintainer-clean: maintainer-clean-msg distclean clean-info

maintainer-clean-msg:
	@echo "This command is intended for maintainers to use; it"
	@echo "deletes files that may require special tools to rebuild."

clean-info:
	rm -f spell.info version.texi
	rm -f *.aux *.cp *.cps *.dvi *.ps *.fn *.fns *.ky *.log *.pg *.toc
	rm -f *.tp *.vr

TAGS: $(SRCS)
	etags $(SRCS)

version.texi:
	echo "@set VERSION $(VERSION)" > version.texi

info: spell.info

spell.info: spell.texi version.texi
	$(MAKEINFO) $(srcdir)/spell.texi

dvi: spell.dvi

spell.dvi: spell.texi
	$(TEXI2DVI) $(srcdir)/spell.texi

ps: spell.ps

spell.ps: spell.dvi
	$(DVIPS) -o $@ ./spell.dvi

dist: $(DISTFILES)
	rm -rf spell-$(VERSION)
	mkdir spell-$(VERSION)
	chmod 777 spell-$(VERSION)
	for file in $(DISTFILES); \
        do \
	  ln $(srcdir)/$$file spell-$(VERSION) 2> /dev/null \
	    || cp -p $(srcdir)/$$file spell-$(VERSION); \
	done
	chmod -R a+r spell-$(VERSION)
	tar -chozf spell-$(VERSION).tar.gz spell-$(VERSION)
	rm -rf spell-$(VERSION)

check:

installcheck:

installdirs: mkinstalldirs
	$(srcdir)/mkinstalldirs $(bindir) $(infodir)

Makefile: Makefile.in config.status
	CONFIG_FILES=$@ CONFIG_HEADERS= ./config.status

config.status: configure
	./config.status --recheck

configure: configure.in
	cd $(srcdir) && $(AUTOCONF)

# Prevent GNU make v3 from overflowing arg limit on SysV.
.NOEXPORT:
