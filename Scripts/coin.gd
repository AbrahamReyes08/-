extends Area2D


func _on_area_entered(area):
	if area.name=="enterCoin":
		player_data.coin+=1
		print(player_data.coin)
		queue_free()
