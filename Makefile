# Makefile for gsm_ussd.pl

PREFIX		= /usr/local

INSTALL_PATH	= $(PREFIX)
BIN_PATH	= $(INSTALL_PATH)/bin
MAN_PATH	= $(INSTALL_PATH)/share/man

.PHONY:		install all clean


all:		doc

install:	all
	install -d $(BIN_PATH)
	install gsm-ussd.pl $(BIN_PATH)/gsm-ussd

doc:
	pod2man --name GSM-USSD docs/en.pod > docs/en.man
	pod2man --name GSM-USSD docs/de.pod > docs/de.man

install-doc:	doc
	install docs/en.man $(MAN_PATH)/man1/gsm-ussd.1
	install docs/de.man $(MAN_PATH)/de/man1/gsm-ussd.1

tar:		doc
	cd packages && ./mktar.sh

deb:		doc
	cd packages && ./mkdeb.sh

rpm:		doc
	cd packages && ./mktar.sh -r && ./mkrpm.sh

clean:
	rm -f docs/*.man
	rm -f packages/*.deb
	rm -f packages/*.tar.gz
	rm -f packages/*.spec
	rm -f packages/*.rpm
