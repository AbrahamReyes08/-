extends Node2D
@onready var flecha = preload("res://Adds/MovementScenes/arrow.tscn")
@onready var enemigo = preload("res://Adds/Scenes/enemigo.tscn")
@onready var campovision = $"FieldOfView"
var cantflechas = 3
var jugador

func _ready():
	$"Cooldown".start()

func set_player(jugador):
	self.jugador=jugador

func _process(delta):
	pass

func get_enemies_in_area(area: Area2D):
	return area.get_overlapping_areas()

func get_random_enemy(enemies):
	var closest_enemy = null
	var cantenemies = 0
	for enemigo in enemies:
		if(enemigo.get_collision_layer_value(3)):
			cantenemies+=1
	if(cantenemies==0):
		return null
	var random = randi_range(0, cantenemies-1)
	return enemies[random].global_position



func _on_cooldown_timeout():
	for i in range(cantflechas):
		var enemies = get_enemies_in_area(campovision)
		var posicion = get_random_enemy(enemies)
		if(posicion!=null):
			$CooldownBetween.start()
			var newflecha = flecha.instantiate()
			add_child(newflecha)
			newflecha.global_position = Vector2(jugador.global_position.x, jugador.global_position.y)
			newflecha.set_targets(posicion)
			await ($CooldownBetween.timeout)
		
