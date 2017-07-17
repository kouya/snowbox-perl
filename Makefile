INSTALL=	install
PREFIX=		/usr/local

DISTFILES=	AUTHOR COPYING INSTALL README Makefile config user.auth.example snowbox snowbox.8
VERSION=	1.0.1
DISTDIR=	snowbox-$(VERSION)

all:
	@echo "Type \"make install\" to install Snowbox."

install:
	if [ ! -d "$(PREFIX)/sbin" ]; then \
		mkdir -p $(PREFIX)/sbin; \
	fi
	install snowbox $(PREFIX)/sbin

	if [ ! -d "$(PREFIX)/man/man8" ]; then \
		mkdir -p $(PREFIX)/man/man8; \
	fi
	install -m 0644 snowbox.8 $(PREFIX)/man/man8
	
	if [ ! -d "/etc/snowbox" ]; then \
		mkdir -p /etc/snowbox; \
		install -m 0600 config /etc/snowbox; \
		install -m 0600 user.auth.example /etc/snowbox; \
	fi

dist:
	mkdir $(DISTDIR)
	cp -RX $(DISTFILES) $(DISTDIR)
	tar -czf $(DISTDIR).tar.gz $(DISTDIR)
	rm -rf $(DISTDIR)
