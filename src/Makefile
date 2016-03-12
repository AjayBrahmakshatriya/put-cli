BUILD_CONFIG := TRUE
all:
	@cp put ../build/
	@cp autocomplete ../build/
	@cp autocomplete_script ../build/
	@chmod +x ../build/put
	@chmod +x ../build/autocomplete
	@mkdir -p ~/.put-cli
	@mkdir -p ~/.put-cli/file_cache
ifeq ($(BUILD_CONFIG),TRUE)
	@cp config/put-cli.json ~/.put-cli/
endif
