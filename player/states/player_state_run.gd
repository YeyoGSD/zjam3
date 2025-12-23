class_name RunningState
extends PlayerStateBase

func start():
	player.velocity = Vector2(player.running_speed, 0)

func on_physics_process(_delta: float) -> void:
	if player.ray_cast_front_high.is_colliding() and not player.ray_cast_front_low.is_colliding():
		player.recieve_damage(1)
