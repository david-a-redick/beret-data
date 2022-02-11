PREFIX ?= $(HOME)/.local

PATH_TO_DATA ?= $(PREFIX)/share/games/beret

default:
	@echo To examine settings:
	@echo make echo
	@echo
	@echo To install:
	@echo make install

echo:
	@echo PREFIX=$(PREFIX)
	@echo
	@echo PATH_TO_DATA=$(PATH_TO_DATA)

DIRS=images music rooms sfx
install:
	$(foreach DIR, $(DIRS), \
		mkdir -p $(PATH_TO_DATA)/$(DIR); \
		find $(DIR) -type f | xargs -I FILE install --mode=644 FILE $(PATH_TO_DATA)/$(DIR); \
	)

uninstall:
	rm -rf $(PATH_TO_DATA)

debian-build:
	cd .. && tar -jcf beret-data_1.2.2.orig.tar.bz2 beret-data-1.2.2
	debuild -us -uc

debian-clean:
	rm -rf debian/.debhelper
	rm -rf debian/beret-data

