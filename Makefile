all:
	@mkdir -p build
	@make -C src
clean:
	@rm -rf build

