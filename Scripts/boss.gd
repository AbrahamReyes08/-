extends CharacterBody2D

@onready var movimiento: MovimientoEnem = $"MovimientoEnem" as MovimientoEnem
@onready var animPlayer = $"AnimationPlayer"
@onready var coinLoot=preload("res://Scenes/coin.tscn")

var jugador
var hp = 2500
var damage = 75
var muerto=false
var jumping = false
var movejump = false

var input_vector: Vector2

func _ready():
	$JumpCooldown.start()
	movimiento.speed = 110
	movimiento.setupPersonaje(self)
	
func set_target(jugador):
	self.jugador=jugador

func _process(delta):
	z_index = global_position.x

func _physics_process(delta):
	var posicion = jugador.position
	var direccion = posicion - self.position
	
	if(hp>0):
		if(!jumping):
			movimiento.moverse(direccion.normalized())
			$Sprite2D.flip_h = direccion.x<0
			if(!movejump):
				animPlayer.play("Move")
	else:
		$HitBox.disable_mode=true
		$HurtBox.disable_mode=true
		movimiento.detenerse()
		if(!muerto):
			muerto=true
			selfdestroy()

func knockback(damageSourcePos: Vector2, HitBox: Area2D):
	if(!muerto):
		if(HitBox.name=="HitBox"):
			var knockbackDir = damageSourcePos.direction_to(self.global_position)
			var knockback = knockbackDir*HitBox.knockback
			global_position+=knockback
			await (animPlayer.animation_finished)

func selfdestroy():
	if(muerto):
		animPlayer.play("Death")
		$Effect.play()
		await (animPlayer.animation_finished)
		loot_coin()
		queue_free()
		


func _on_hurt_box_area_entered(HitBox: Area2D):
	if(hp>0):
		var damageSourcePos = HitBox.global_position
		knockback(damageSourcePos, HitBox)
		var damage=HitBox.damage
		hp-=damage
	

func loot_coin():
	var coin=coinLoot.instantiate()
	coin.global_position = global_position
	get_tree().get_root().add_child(coin)


func _on_jump_cooldown_timeout():
	jumping = true
	animPlayer.play("Jump")
	await(animPlayer.animation_finished)
	animPlayer.play("OnAir")
	$OnAirTime.start()
	jumping = false
	movejump = true
	$HitBox/CollisionShape2D.disabled = true
	$HurtBox/CollisionShape2D.disabled = true
	$MovimientoEnem.speed = 250
	


func _on_on_air_time_timeout():
	jumping = true
	$OnAirTime.stop()
	$FallingTime.start()
	

func _on_falling_time_timeout():
	$HurtBox/CollisionShape2D.disabled = false
	$HitBox/CollisionShape2D.disabled = false
	animPlayer.play("Fall")
	await(animPlayer.animation_finished)
	jumping = false
	movejump = false
	$FallingTime.stop()
	$MovimientoEnem.speed = 110
	
func fallshake():
	jugador.get_node("Camera2D").shake(0.5, 7)
