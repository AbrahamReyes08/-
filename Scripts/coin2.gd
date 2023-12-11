extends Area2D
var posicion
var facepos
var value=1
var finished = false

func _process(delta):
	if(finished):
		queue_free()

func _on_area_entered(area: Area2D):
	if area.name=="enterCoin":
		var personaje = area.get_parent()
		var prob = randi_range(1, 100)
		if(prob<=personaje.healprob):
			personaje.hp+=personaje.heal
			if(personaje.hp>personaje.maxhp):
				personaje.hp=personaje.maxhp
		facepos = area.get_parent().get_parent().get_node("Personaje").get_node("Playerface")
		$CoinBody/movimeintoflecha.speed = 1000
		$CoinBody/movimeintoflecha.setup($CoinBody)
		posicion = facepos.global_position-$CoinBody.global_position
		personaje.xp+=value
	
func _physics_process(delta):
	if(posicion!=null && !finished):
		posicion = facepos.global_position-$CoinBody.global_position
		$CoinBody/movimeintoflecha.moverse(posicion)
		if($Timer.is_stopped()):
			$Timer.start()

func _on_timer_timeout():
	posicion=null
	finished = true
