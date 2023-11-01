extends Control

@onready var brightness_slider=get_node("SettingsTabs/Video/BrilloSlide")

@onready var music_slider=get_node("SettingsTabs/Audio/MusicVOL")
@onready var efecto_slider=get_node("SettingsTabs/Audio/EfectosVOL")


func _on_music_vol_value_changed(value):
	pass # Replace with function body.


func _on_efectos_vol_value_changed(value):
	pass # Replace with function body.

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

func _on_brillo_slide_2_value_changed(value):
	GlobalWorldEnvironment.environment.adjustment_brightness = value
