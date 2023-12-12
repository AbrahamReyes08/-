extends Node2D

@onready var enemy = preload("res://Adds/Scenes/enemigo.tscn")
@onready var enemy2 = preload("res://Adds/Scenes/enemigo2.tscn")
@onready var personaje = $Personaje
@onready var mejoras= $Mejoraswindow
@onready var arrowthrower = $"ArrowThrower"
@onready var pauseButton = $Personaje/PauseButton
@onready var mejorasScene=preload("res://Scenes/mejoraswindow.tscn")

var paused = null
var pauseee=false
var fase2=false
var maxenemy=25
var cantenemy=0

func _ready():
	$Personaje/BarraSalud.z_index = 10
	$Personaje/Playerface.z_index = 10
	$Personaje/BarraXP.z_index = 10
	$Personaje/HPLbl.z_index = 10
	$Personaje/TitleHPLbl.z_index = 10
	$Personaje/XPTexturaBack.z_index = 10
	$Personaje/DamageLbl.z_index = 10
	$Personaje/Espada.z_index = 10
	$EnemySpawn.start()
	$fuente.play("default")
	arrowthrower.set_player(personaje)
	$Start.play()
	$EnemyChange.start()
	


func _process(delta):
	$Personaje/BarraSalud/BarraSaludTextura.value = personaje.hp
	$Personaje/HPLbl.text = str(personaje.hp)+"/"+str(personaje.maxhp)
	$Personaje/DamageLbl.text = str(personaje.get_node("HitBox").damage)
	arrowthrower.position=personaje.position
	
	if Input.is_action_just_pressed("Pause"):
		$Popup2.visible=true
	
	$Personaje/XPTexturaBack.self_modulate.a = 0.5
	$Personaje/BarraXP/XPTextura.max_value = personaje.nextxp
	$Personaje/BarraXP/XPTextura.value = personaje.xp
	
	if(personaje.xp==personaje.nextxp):
		get_tree().paused=true
		$Mejoraswindow.visible=true
		personaje.xp=0
	
	$Personaje/Label2.text=str(personaje.pts)
	


func _on_enemy_spawn_timeout():
	if(cantenemy<maxenemy):
		var position_player = personaje.position
		var new_x = randi_range(position_player.x-210, position_player.x+210)
		var new_y = randi_range(position_player.y-130, position_player.y+130)
		while(((new_x>position_player.x-190 && new_x<position_player.x+190) && (new_y>position_player.y-110 && new_y<position_player.y+110)) || ((new_x<25 || new_x>1135) || (new_y<25 || new_y>625)) || (is_position_colliding(new_x, new_y))):
			new_x = randi_range(position_player.x-210, position_player.x+210)
			new_y = randi_range(position_player.y-130, position_player.y+130)
		var enemy_instance
		if(fase2):
			var rand: int = randi_range(0,1)
			if(rand == 0):
				enemy_instance = enemy.instantiate()
			elif(rand==1):
				enemy_instance = enemy2.instantiate()
				enemy_instance.get_node("MovimientoEnem").speed = 120
		else:
			enemy_instance = enemy2.instantiate()
		enemy_instance.position = Vector2(new_x, new_y)
		enemy_instance.set_target(personaje)
		add_child(enemy_instance)
		cantenemy+=1

func is_position_colliding(x, y):
	var static_body = get_node("StaticBody2D")
	var collision_shapes = static_body.get_children()
	for shape in collision_shapes:
		if shape is CollisionShape2D:
			if shape.collide_point(Vector2(x, y)):
				return true
	return false

func _on_child_exiting_tree(enemy):
	cantenemy-=1


func _on_pause_button_pressed():
	$Popup2.visible=true
	

func _on_popup_2_visibility_changed():
	if $Popup2.visible==true:
		get_tree().paused=true
	else:
		get_tree().paused=false
		

func _on_salir_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_mejoraswindow_visibility_changed():
	if $Mejoraswindow.visible==true:
		get_tree().paused=true
	else:
		get_tree().paused=false


func _on_enemy_change_timeout():
	
	if(!fase2):
		fase2=true
		var position_player = personaje.position
		var new_x = randi_range(position_player.x-210, position_player.x+210)
		var new_y = randi_range(position_player.y-130, position_player.y+130)
		while(((new_x>position_player.x-190 && new_x<position_player.x+190) && (new_y>position_player.y-110 && new_y<position_player.y+110)) || ((new_x<25 || new_x>1135) || (new_y<25 || new_y>625)) || (is_position_colliding(new_x, new_y))):
			new_x = randi_range(position_player.x-210, position_player.x+210)
			new_y = randi_range(position_player.y-130, position_player.y+130)
		var enemy_instance = enemy2.instantiate()
		enemy_instance.scale = Vector2(3, 3)
		enemy_instance.get_node("MovimientoEnem").speed-=15
		enemy_instance.boss=true
		enemy_instance.hp+=750
		enemy_instance.get_node("HitBox").damage+=10
		enemy_instance.position = Vector2(new_x, new_y)
		enemy_instance.set_target(personaje)
		add_child(enemy_instance)
	else:
		pass


func _on_bushes_area_area_entered(area):
	if area.name=="enterCoin":
		personaje.get_node("Movimiento").speed-=50

func _on_bushes_area_area_exited(area):
	if area.name=="enterCoin":
		personaje.get_node("Movimiento").speed+=50
