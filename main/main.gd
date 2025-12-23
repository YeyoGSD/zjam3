extends Node

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "DayCycle":
		#TODO: Manejar fin del juego
		print("Game Over")


func _on_world_limits_body_entered(body: Node2D) -> void:
	if body is Player:
		#TODO: Manejar muerte por caida
		get_tree().call_deferred("reload_current_scene")


func _on_win_area_body_entered(body: Node2D) -> void:
	if body is Player:
		#TODO: Manejar victoria
		print("You Win")
