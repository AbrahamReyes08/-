extends Popup


func _on_button_mouse_entered():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()

func _on_button_2_mouse_entered():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()

func _on_button_3_mouse_entered():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()
