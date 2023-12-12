extends Camera2D

var shake_amount = 0.0
var default_offset = offset
var pos_x
var pos_y
@onready var timer = $Timer
@onready var tween: Tween = create_tween()

func _ready():
	set_process(true)
	randomize()

func _process(_delta: float):
	offset = Vector2(randf_range (-1, 1)* shake_amount, randf_range (-1, 1)* shake_amount)

func shake(time: float, amount: float):
	timer.wait_time = time
	shake_amount = amount
	set_process(true)
	timer.start()

func _on_timer_timeout():
	set_process(false)
	tween.interpolate_value(self, "offset", 1, 1, Tween.TRANS_LINEAR, Tween.EASE_IN)
