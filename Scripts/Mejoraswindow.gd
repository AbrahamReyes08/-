extends Window

var eligio=0

func _ready():
	$AnimatedSprite2D.play("IDLE")


func _on_button_pressed():
	visible=false

func _on_button_mouse_entered():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()

func _on_button_2_mouse_entered():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()

func _on_regresar_mouse_entered():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()


func _on_b_1_pressed():
	visible=false


func _on_b_2_pressed():
	visible=false


func _on_b_3_pressed():
	visible=false



func _on_b_4_pressed():
	visible=false
