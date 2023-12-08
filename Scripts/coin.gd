extends Area2D
var posicion
var facepos
var finished = false

func _process(delta):
	if(finished):
		queue_free()

func _on_area_entered(area: Area2D):
	if area.name=="enterCoin":
		var personaje = area.get_parent()
		facepos = area.get_parent().get_parent().get_node("Personaje").get_node("Playerface")
		$CoinBody/movimeintoflecha.speed = 1000
		$CoinBody/movimeintoflecha.setup($CoinBody)
		posicion = facepos.global_position-$CoinBody.global_position
		personaje.xp+=1
	
func _physics_process(delta):
	if(posicion!=null && !finished):
		posicion = facepos.global_position-$CoinBody.global_position
		$CoinBody/movimeintoflecha.moverse(posicion)
		if($Timer.is_stopped()):
			$Timer.start()

func _on_timer_timeout():
	posicion=null
	finished = true
