extends Node
class_name Movimiento

var speed = 50;
var personaje: CharacterBody2D

func setupPersonaje(personaje: CharacterBody2D):
	self.personaje=personaje

func moverse(inputvector: Vector2):
	personaje.velocity = inputvector.normalized()*speed
	personaje.move_and_slide()

func detenerse():
	personaje.velocity=Vector2.ZERO

