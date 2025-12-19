extends Node

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "DayCycle":
		#TODO: Manejar fin del juego
		print("Game Over")
