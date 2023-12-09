extends Window

func _ready():
	$AnimatedSprite2D.play("IDLE")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

func _on_button_mouse_entered():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()

func _on_button_2_mouse_entered():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()

func _on_regresar_mouse_entered():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()
