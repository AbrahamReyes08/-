extends Node

signal brightness_updated(value)

func change_disp(option_index):
	if option_index == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	elif option_index == 1:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func update_brightness(value):
	emit_signal("brightness_updated", value)

func volume(bus_idx, vol):
	AudioServer.set_bus_volume_db(bus_idx, vol)

