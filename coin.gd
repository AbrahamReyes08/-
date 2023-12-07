extends Area2D

@onready var animCoin =$anim

func _physics_process(delta):
	animCoin.play("active")

func _on_area_entered(area):
	if area.name=="enterCoin":
		queue_free()
