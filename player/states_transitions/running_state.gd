extends RunningState

func on_physics_process(delta: float) -> void:
	super.on_physics_process(delta)
	
	if not player.is_on_floor():
		state_transition_requested.emit(states[Player.State.FALLING])
	elif player.ray_cast_wall_high.is_colliding():
		state_transition_requested.emit(states[Player.State.CLIMBING])


func on_unhandled_key_input(event: InputEvent) -> void:
	super.on_unhandled_key_input(event)
	
	if event.is_action_pressed("slide"):
		state_transition_requested.emit(states[Player.State.SLIDING])
	elif event.is_action_pressed("jump"):
		state_transition_requested.emit(states[Player.State.JUMPING])
