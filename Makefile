ROOT_DIR := `pwd`
BUILD_CONFIG := TRUE
TARGET := /usr/local/bin/put

all:
	@mkdir -p build
	@make -C src BUILD_CONFIG=$(BUILD_CONFIG)
install:
	@sudo rm -f $(TARGET)
	@sudo ln -s $(ROOT_DIR)/build/put $(TARGET)
clean:
	@rm -rf build
