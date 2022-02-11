#PREFIX ?= $(HOME)/.local
#PREFIX ?= .

#PATH_TO_DATA ?= $(PREFIX)/share/games/beret
PATH_TO_DATA ?= ./foo


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
		find images -type f | xargs -I FILE install --mode=644 FILE $(PATH_TO_DATA)/$(DIR); \
	)
