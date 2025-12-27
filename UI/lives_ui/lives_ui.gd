extends Control

@onready var heart: TextureRect = $HBoxContainer/Heart
@onready var heart_2: TextureRect = $HBoxContainer/Heart2
@onready var heart_3: TextureRect = $HBoxContainer/Heart3

func _ready() -> void:
	EventBus.player_lives_changed.connect(func(lives: int):
		match lives:
			2: heart.self_modulate = Color.BLACK
			1: heart_2.self_modulate = Color.BLACK
	)
	
