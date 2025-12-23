class_name LevelBase
extends Node

@export var world_limit: Area2D
@export var win_area: Area2D

@onready var game_over_screen: Control = $UI/GameOverScreen

func _game_over() -> void:
	game_over_screen.visible = true
	get_tree().paused = true


func _ready() -> void:
	world_limit.body_entered.connect(_on_world_limits_body_entered)
	win_area.body_entered.connect(_on_win_area_body_entered)
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
