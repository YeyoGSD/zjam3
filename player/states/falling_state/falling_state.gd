class_name FallingState
extends PlayerStateBase

func on_physics_process(delta: float) -> void:
	if not player.is_on_floor():
		player.velocity.y += player.gravity * delta
