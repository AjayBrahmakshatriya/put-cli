ROOT_DIR := `pwd`

TARGET := /usr/local/bin/put

all:
	@mkdir -p build
	@make -C src
install:
	@sudo rm -f $(TARGET)
	@sudo ln -s $(ROOT_DIR)/build/put $(TARGET)
clean:
	@rm -rf build
