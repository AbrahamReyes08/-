extends Popup

func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		popup_hide
