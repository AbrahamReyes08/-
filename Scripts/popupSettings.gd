extends Popup

@onready var brightness_slider=get_node("SettingsTabs/Video/BrilloSlide")

@onready var music_slider=get_node("SettingsTabs/Audio/MusicVOL")
@onready var efecto_slider=get_node("SettingsTabs/Audio/EfectosVOL")



func _on_displaymode_item_selected(index):
	GlobalSettings.change_disp(index)

func _on_brillo_slide_2_value_changed(value):
	GlobalSettings.update_brightness(value)

func _on_efectos_vol_value_changed(value):
	GlobalSettings.volume(2,value)

func _on_music_vol_value_changed(value):
	GlobalSettings.volume(1,value)


func _on_displaymode_pressed():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()

func _on_brillo_slide_2_mouse_entered():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()

func _on_music_vol_mouse_entered():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()

func _on_efectos_vol_mouse_entered():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()

func _on_settings_tabs_tab_selected(tab):
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()
