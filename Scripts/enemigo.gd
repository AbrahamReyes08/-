extends CharacterBody2D

@onready var movimiento: MovimientoEnem = $"MovimientoEnem" as MovimientoEnem
@onready var animPlayer = $"AnimationPlayer"
var jugador
var hp = 100
var damage = 25
var muerto=false

var input_vector: Vector2

func _ready():
	movimiento.setupPersonaje(self)
	
func set_target(jugador):
	self.jugador=jugador

func _physics_process(delta):
	var posicion = jugador.position
	var direccion = posicion - self.position
	movimiento.moverse(direccion.normalized())
	$Sprite2D.flip_h = direccion.x<0
	if(hp>0):
		animPlayer.play("Move")
	else:
		if(!muerto):
			muerto=true
			movimiento.detenerse()
			selfdestroy()


func selfdestroy():
	if(hp<=0):
		animPlayer.play("Death")
		await (animPlayer.animation_finished)
		queue_free()

func _on_hurt_box_area_entered(HitBox):
	var damage=HitBox.damage
	hp-=damage
	
