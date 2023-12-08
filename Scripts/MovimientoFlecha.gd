extends Node
class_name MovimientoFlecha

var speed = 700;
var flecha: CharacterBody2D

func setup(flecha: CharacterBody2D):
	self.flecha=flecha

func moverse(Vector: Vector2):
	flecha.velocity = Vector.normalized()*speed
	flecha.move_and_slide()
