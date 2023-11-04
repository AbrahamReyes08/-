extends Control


func _on_jugar_pressed():
	pass # Replace with function body.


func _on_salir_pressed():
	get_tree().quit()


func _on_button_pressed():
	$Popup.popup()


func _on_button_mouse_entered():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()


func _on_jugar_mouse_entered():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()


func _on_salir_mouse_entered():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()
