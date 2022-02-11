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
	install -D --mode=644 beret.desktop $(PREFIX)/share/applications/beret.desktop
	install -D --mode=644 beret.png $(PREFIX)/share/pixmaps/beret.png

uninstall:
	rm -rf $(PATH_TO_DATA)
	rm -f $(PREFIX)/share/applications/beret.desktop
	rm -f $(PREFIX)/share/pixmaps/beret.png

