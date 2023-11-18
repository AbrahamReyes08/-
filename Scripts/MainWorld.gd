extends Node2D

@onready var enemy = preload("res://Adds/Scenes/enemigo.tscn")
@onready var personaje = $Personaje
var maxenemy=25
var cantenemy=0

func _ready():
	$EnemySpawn.start()
	$fuente.play("default")
	
func _process(delta):
	pass

func _on_enemy_spawn_timeout():
	if(cantenemy<maxenemy):
		var position_player = personaje.position
		var new_x = randi_range(position_player.x-210, position_player.x+210)
		var new_y = randi_range(position_player.y-130, position_player.y+130)
		while(((new_x>position_player.x-190 && new_x<position_player.x+190) && (new_y>position_player.y-110 && new_y<position_player.y+110)) || ((new_x<25 || new_x>1135) || (new_y<25 || new_y>625))):
			new_x = randi_range(position_player.x-210, position_player.x+210)
			new_y = randi_range(position_player.y-130, position_player.y+130)
		var enemy_instance = enemy.instantiate()
		enemy_instance.position = Vector2(new_x, new_y)
		enemy_instance.set_target(personaje)
		add_child(enemy_instance)
		cantenemy+=1
	
