ROOT_DIR := `pwd`
BUILD_CONFIG := TRUE
TARGET := /usr/local/bin/put
OS := $(shell uname)
ifeq ($(OS),Darwin)
        AUTOCOMPLETE_TARGET := $(shell brew --prefix)/etc/bash_completion.d/put
else ifeq ($(OS),Linux)
        AUTOCOMPLETE_TARGET := /etc/bash_completion.d/put
endif

all:
	@mkdir -p build
	@make -C src BUILD_CONFIG=$(BUILD_CONFIG)
install:
	@sudo rm -f $(TARGET)
	@sudo ln -s $(ROOT_DIR)/build/put $(TARGET)
	@sudo rm -f $(AUTOCOMPLETE_TARGET)
	@sudo ln -s $(ROOT_DIR)/build/autocomplete_script $(AUTOCOMPLETE_TARGET)
	@mkdir -p ~/.put-cli/autocomplete/
	@rm -f ~/.put-cli/autocomplete/autocomplete
	@ln -s $(ROOT_DIR)/build/autocomplete ~/.put-cli/autocomplete/autocomplete
	@echo "Install completed! Please restart the terminals for full functionality"
uninstall:
	@sudo rm -f $(TARGET)
	@sudo rm -f $(AUTOCOMPLETE_TARGET)
	@rm -f ~/.put-cli/autocomplete/autocomplete
	@rm -f ~/.put-cli/autocomplete

clean:
	@rm -rf build
	@rm -rf ~./put-cli
