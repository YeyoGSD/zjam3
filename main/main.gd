extends Node

@onready var game_over_screen: Control = $UI/GameOverScreen

func _game_over() -> void:
	game_over_screen.visible = true
	get_tree().paused = true


func _ready() -> void:
	EventBus.player_died.connect(func():
		_game_over())


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "DayCycle":
		_game_over()


func _on_world_limits_body_entered(body: Node2D) -> void:
	if body is Player:
		_game_over()


func _on_win_area_body_entered(body: Node2D) -> void:
	if body is Player:
		#TODO: Manejar victoria
		print("You Win")
