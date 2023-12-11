extends CharacterBody2D

@onready var movimiento: MovimientoEnem = $"MovimientoEnem" as MovimientoEnem
@onready var animPlayer = $"AnimationPlayer"
@onready var coinLoot=preload("res://Scenes/coin2.tscn")

var jugador
var hp = 100
var damage = 25
var muerto=false
var boss = false

var input_vector: Vector2

func _ready():
	movimiento.setupPersonaje(self)
	
func set_target(jugador):
	self.jugador=jugador

func _physics_process(delta):
	var posicion = jugador.position
	var direccion = posicion - self.position
	if(hp>0 ):
		movimiento.moverse(direccion.normalized())
		$Sprite2D.flip_h = direccion.x<0
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
	if(boss):
		coin.value = 15
	coin.global_position = global_position
	get_tree().get_root().add_child(coin)
