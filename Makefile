ROOT_DIR := `pwd`
BUILD_CONFIG := TRUE
TARGET := /usr/local/bin/put
OS := $(shell uname)
ifeq ($(OS),Darwin)
        AUTOCOMPLETE_TARGET := /usr/local/etc/bash_completion.d
else ifeq ($(OS),Linux)
        AUTOCOMPLETE_TARGET := /etc/bash_completion.d
endif

all:
	@mkdir -p build
	@make -C src BUILD_CONFIG=$(BUILD_CONFIG)
install:
	@sudo rm -f $(TARGET)
	@sudo ln -s $(ROOT_DIR)/build/put $(TARGET)
	@sudo rm -f $(AUTOCOMPLETE_TARGET)/put
	@sudo ln -s $(ROOT_DIR)/build/autocomplete_script $(AUTOCOMPLETE_TARGET)/put
	@mkdir -p ~/.put-cli/autocomplete/
	@rm -f $(AUTOCOMPLETE_TARGET)/helpers/put
	@sudo mkdir -p $(AUTOCOMPLETE_TARGET)/helpers
	@sudo ln -s $(ROOT_DIR)/build/autocomplete $(AUTOCOMPLETE_TARGET)/helpers/put
	@echo "Install completed! Please restart the terminals for full functionality"
uninstall:
	@sudo rm -f $(TARGET)
	@sudo rm -f $(AUTOCOMPLETE_TARGET)/put
	@sudo rm -f $(AUTOCOMPLETE_TARGET)/helpers/put

clean:
	@rm -rf build
	@rm -rf ~./put-cli
