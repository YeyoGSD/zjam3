class_name LevelBase
extends Node

@export var world_limit: Area2D
@export var win_area: Area2D

@onready var game_over_screen: Control = $UI/GameOverScreen
@onready var win_screen: Control = $UI/WinScreen
@onready var pause_screen: Control = $UI/PauseScreen

func _game_over(screen: Control) -> void:
	screen.visible = true
	get_tree().paused = true


func _ready() -> void:
	world_limit.body_entered.connect(_on_world_limits_body_entered)
	win_area.body_entered.connect(_on_win_area_body_entered)
	EventBus.player_died.connect(func():
		_game_over(game_over_screen))
	EventBus.player_first_hit.connect(_on_player_first_hit)

func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()
	elif event.is_action_pressed("pause"):
		pause_screen.show()
		get_tree().paused = true

func _on_player_first_hit() -> void:
	EventBus.radio_message_show_requested.emit("Ten cuidado, corredor. Si te lastimas perderás velocidad")
	get_tree().create_timer(2).timeout.connect(func():
		EventBus.radio_message_hide_requested.emit())


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "DayCycle":
		_game_over(game_over_screen)


func _on_world_limits_body_entered(body: Node2D) -> void:
	if body is Player:
		_game_over(game_over_screen)


func _on_win_area_body_entered(body: Node2D) -> void:
	if body is Player:
		_game_over(win_screen)
