class_name RunningState
extends PlayerStateBase

func start():
	player.velocity = Vector2(player.running_speed, 0)
