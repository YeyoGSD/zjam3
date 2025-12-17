extends FallingState

func on_physics_process(delta: float) -> void:
	super.on_physics_process(delta)
	if player.is_on_floor():
		state_transition_requested.emit(states[Player.State.RUNNING])
	elif player.ray_cast_wall_high.is_colliding():
		state_transition_requested.emit(states[Player.State.CLIMBING])
