extends Node

func _ready() -> void:
	EventBus.player_got_hurt.connect(func(damage: int):
		#TODO: Manejar daño al player
		print("Player got hurt: ", damage))

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "DayCycle":
		#TODO: Manejar fin del juego
		print("Game Over")
