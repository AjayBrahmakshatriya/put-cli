OS := $(shell uname)
BUILD_CONFIG := TRUE
ifeq ($(OS),Darwin)
	AUTOCOMPLETE_TARGET := $(shell brew --prefix)/etc/bash_completion.d/put
else ifeq ($(OS),Linux)
	AUTOCOMPLETE_TARGET := /etc/bash_completion.d/put
endif

all:
	@cp put ../build/
	@chmod +x ../build/put
	@mkdir -p ~/.put-cli
ifeq ($(BUILD_CONFIG),TRUE)
	@cp config/put-cli.json ~/.put-cli/
endif
	@sudo cp autocomplete_script $(AUTOCOMPLETE_TARGET)
	@cp commands.txt ~/.put-cli/autocomplete/
