class_name JumpingState
extends PlayerStateBase

func start():
	player.coyote_timer.stop()
	player.velocity.y = player.jump_force
	player.animated_sprite_2d.play("jumping")
