DIR_CRYPT = crypt


$(DIR_CRYPT).tgz.gpg : $(DIR_CRYPT)
	tar -cz $(DIR_CRYPT) | gpg -c -o $@

decrypt:
	@[ -d $(DIR_CRYPT) ] || { gpg -d $(wildcard *.tgz.gpg) | tar xz; }

.PHONY : uncrypt
