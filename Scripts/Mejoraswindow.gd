extends Window

var player
var eligio=0

func _ready():
	player = self.get_parent().get_node("Personaje")
	$AnimatedSprite2D.play("IDLE")
	
	


func _on_button_pressed():
	visible=false



func _on_b_1_pressed():
	var nivel = player.niveles[0]
	var arrows = self.get_parent().get_node("ArrowThrower")
	if(nivel==0):
		arrows.knockback = 15
		player.niveles[0] = 1
	elif(nivel==1):
		arrows.damage+=25
		player.niveles[0] = 2
	elif(nivel==2):
		arrows.cantflechas+=2
		player.niveles[0] = 3
	visible=false
	$Label6/lvlFlechas.text = str(player.niveles[0])
	$SubirNivel.play()

func _on_b_2_pressed():
	var nivel = player.niveles[1]
	var damageplayer = player.get_node("HitBox")
	if(nivel==0):
		damageplayer.damage+=30
		player.niveles[1] = 1
	elif(nivel==1):
		damageplayer.damage+=30
		player.niveles[1] = 2
	elif(nivel==2):
		damageplayer.damage+=25
		player.niveles[1] = 3
	visible=false
	$"Label7/lvlDaño".text = str(player.niveles[1])
	$SubirNivel.play()

func _on_b_3_pressed():
	var nivel = player.niveles[2]
	if(nivel==0):
		player.healprob+=5
		player.niveles[2] = 1
	elif(nivel==1):
		player.heal+=10
		player.niveles[2] = 2
	elif(nivel==2):
		player.healprob+=5
		player.heal+=10
		player.niveles[2] = 3
	visible=false
	$Label8/lvlCuracion.text = str(player.niveles[2])
	$SubirNivel.play()

func _on_b_4_pressed():
	var nivel = player.niveles[3]
	if(nivel==0):
		player.maxhp+=20
		player.hp+=20
		player.niveles[3] = 1
	elif(nivel==1):
		player.maxhp+=20
		player.hp+=20
		player.niveles[3] = 2
	elif(nivel==2):
		player.maxhp+=35
		player.hp+=35
		player.niveles[3] = 3
	visible=false
	$Label9/lvlVida.text = str(player.niveles[3])
	$SubirNivel.play()

func _on_b_5_pressed():
	var nivel = player.niveles[4]
	var knockbackplayer = player.get_node("HitBox")
	if(nivel==0):
		knockbackplayer.knockback+=5
		player.niveles[4] = 1
	elif(nivel==1):
		knockbackplayer.knockback+=5
		player.niveles[4] = 2
	elif(nivel==2):
		knockbackplayer.knockback+=10
		player.niveles[4] = 3
	visible=false
	$Label10/lvlVelocidad.text=str(player.niveles[4])
	$SubirNivel.play()

func _on_b_1_mouse_entered():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()

func _on_b_2_mouse_entered():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()

func _on_b_3_mouse_entered():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()

func _on_b_4_mouse_entered():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()

func _on_b_5_mouse_entered():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()
