extends CharacterBody2D

@onready var movimiento: MovimientoEnem = $"MovimientoEnem" as MovimientoEnem
var jugador

var input_vector: Vector2

func _ready():
	movimiento.setupPersonaje(self)
	
func set_target(jugador):
	self.jugador=jugador

func _physics_process(delta):
	var posicion = jugador.position
	var direccion = posicion - self.position
	movimiento.moverse(direccion.normalized())
