class_name ClimbingState
extends PlayerStateBase

func on_physics_process(_delta: float) -> void:
	player.velocity = Vector2(0, player.climb_speed)
