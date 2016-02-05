ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all:
	@mkdir -p build
	@make -C src
install:
	@sudo rm -f /usr/bin/put 
	@sudo ln -s $(ROOT_DIR)/build/put /usr/bin/put
clean:
	@rm -rf build

