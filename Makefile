DIR_CRYPT = crypt

DIR_SCR := src
DIR_OUT := out

SICP_OUT := $(patsubst %.scm,$(DIR_OUT)/%_scm.txt,$(notdir $(wildcard src/*.scm)))

all : SICP

SICP : $(SICP_OUT)

$(DIR_OUT)/%_scm.txt : $(DIR_SCR)/%.scm | $(DIR_OUT)
	mit-scheme --quiet < $^ > $@

$(DIR_CRYPT).tgz.gpg : $(DIR_CRYPT)
	tar -cz $(DIR_CRYPT) | gpg -c -o $@

decrypt :
	@[ -d $(DIR_CRYPT) ] || { gpg -d $(wildcard *.tgz.gpg) | tar xz; }

$(DIR_OUT) :
	@mkdir -p $@

.PHONY : uncrypt SICP
