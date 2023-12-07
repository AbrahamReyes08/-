extends CanvasLayer

func _process(delta):
	$coin_number.text = var_to_str(player_data.coin)	
