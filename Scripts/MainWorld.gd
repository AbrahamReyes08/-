extends Node2D

func _ready():
	var enemigo = $Enemigo
	var personaje = $Personaje
	enemigo.set_target(personaje)
	
func _process(delta):
	pass
