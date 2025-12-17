class_name JumpingState
extends PlayerStateBase

func start():
	player.velocity.y = player.jump_force
