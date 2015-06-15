.PHONY: all clean check

NPM_BIN := $(shell npm bin)
COFFEE_CC := $(NPM_BIN)/coffee

OBJ := transform-stream-extensions.js

all: $(OBJ)

%.js: %.coffee
	$(COFFEE_CC) -bc --no-header $<

clean:
	rm -f $(OBJ)

check: all
	$(COFFEE_CC) test.coffee
