extends Control

@onready var contador: Label = $Contador
@onready var timer: Timer = $Timer
@onready var timeout: Label = $Timeout

var max_sec: int = 85
var secs_left : int

func _ready() -> void:
	secs_left = max_sec
	contador.text = str(secs_left)


func _on_timer_timeout() -> void:
	if secs_left <= 0:
		timer.stop()
		contador.hide()
		timeout.show()
	secs_left -= 1
	contador.text = str(secs_left)
