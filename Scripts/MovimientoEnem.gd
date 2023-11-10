extends Node
class_name MovimientoEnem

var speed = 55;
var personaje: CharacterBody2D

func setupPersonaje(personaje: CharacterBody2D):
	self.personaje=personaje

func moverse(inputvector: Vector2):
	personaje.velocity = inputvector.normalized()*speed
	personaje.move_and_slide()
