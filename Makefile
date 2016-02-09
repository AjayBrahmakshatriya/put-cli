ROOT_DIR := `pwd`
OS = $(shell uname)

ifeq ($(OS),Linux)
	TARGET := /usr/bin/put
else ifeq ($(OS),Darwin)
	TARGET := /usr/local/bin/put
endif

all:
	@mkdir -p build
	@make -C src
install:
	@sudo rm -f $(TARGET)
	@sudo ln -s $(ROOT_DIR)/build/put $(TARGET)
clean:
	@rm -rf build
