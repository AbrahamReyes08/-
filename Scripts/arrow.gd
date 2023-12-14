extends CharacterBody2D

@onready var movimiento: MovimientoFlecha = $"MovimientoFlecha" as MovimientoFlecha
@onready var sprite = $"Sprite2D"
@onready var animPlayer = $"AnimationPlayer"
var animfinished = false
var aimed = false
var posicion: Vector2
var direccion: Vector2

func _ready():
	sprite.rotate(deg_to_rad(135.0))
	$HitBox.rotate(deg_to_rad(135.0))
	sprite.frame_coords = Vector2(1, 0)
	sprite.scale = Vector2(0.8, 0.8)
	movimiento.setup(self)
	$ArrowSound.play()
	
func set_targets(posicion):
	self.posicion=posicion
	direccion = posicion - self.global_position
	animPlayer.play("Spawn")
	await (animPlayer.animation_finished)
	animfinished=animPlayer.animation_finished

func _physics_process(delta):
	if(animfinished):
		if(!aimed):
			point_at_target(direccion)
			direccion = posicion - self.global_position
			aimed=true
		animPlayer.play("Fly")
		movimiento.moverse(direccion)
		$FlyingTime.start()
	

func point_at_target(direccion):
	var angulo = atan2(direccion.y, direccion.x)
	$HitBox.rotate(angulo)
	sprite.rotate(angulo)

func selfdestroy():
	queue_free()

func _on_timer_timeout():
	selfdestroy()
