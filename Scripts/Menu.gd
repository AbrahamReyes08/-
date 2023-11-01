extends Control


func _on_jugar_pressed():
	pass # Replace with function body.


func _on_salir_pressed():
	get_tree().quit()


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/settings_menu.tscn")
