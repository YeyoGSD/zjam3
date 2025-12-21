extends ClimbingState

func on_physics_process(delta: float) -> void:
	super.on_physics_process(delta)
	
	if not player.ray_cast_front_low.is_colliding():
		state_transition_requested.emit(states[Player.State.RUNNING])
