SCRIPT_DIR=$(HOME)/.config/muscript
DWM_AUTOSTART_DIR=$(HOME)/.dwm

install:
	@install -d $(SCRIPT_DIR)
	@install -p *.sh $(SCRIPT_DIR)
	@install -d $(DWM_AUTOSTART_DIR)
	@install -p .dwm/autostart.sh $(DWM_AUTOSTART_DIR)
	@echo "Installation successful"
	@echo "You may be need install [light maim bc acpi pamixer]"
