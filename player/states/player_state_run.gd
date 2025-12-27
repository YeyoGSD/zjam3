class_name RunningState
extends PlayerStateBase

@export var foot: AudioStreamPlayer

func start():
	player.velocity = Vector2(player.running_speed, 0)
	player.animated_sprite_2d.play("running")
	foot.play()

func end():
	foot.stop()

func on_physics_process(_delta: float) -> void:
	if player.ray_cast_front_high.is_colliding() and not player.ray_cast_front_low.is_colliding():
		player.recieve_damage(1)
