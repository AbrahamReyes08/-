extends Node2D

func _ready():
	var enemigo = $Enemigo
	var personaje = $Personaje
	$fuente.play("default")
	enemigo.set_target(personaje)
	
func _process(delta):
	pass
