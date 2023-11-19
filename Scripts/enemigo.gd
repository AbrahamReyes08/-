extends CharacterBody2D

@onready var movimiento: MovimientoEnem = $"MovimientoEnem" as MovimientoEnem
var jugador
var hp = 100
var damage = 25

var input_vector: Vector2

func _ready():
	movimiento.setupPersonaje(self)
	
func set_target(jugador):
	self.jugador=jugador

func _physics_process(delta):
	var posicion = jugador.position
	var direccion = posicion - self.position
	movimiento.moverse(direccion.normalized())
	selfdestroy()


func selfdestroy():
	if(hp<=0):
		queue_free()

func _on_hurt_box_area_entered(HitBox):
	var damage=HitBox.damage
	hp-=damage
	
