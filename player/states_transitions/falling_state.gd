extends FallingState

func on_physics_process(delta: float) -> void:
	super.on_physics_process(delta)
	if player.is_on_floor():
		state_transition_requested.emit(states[Player.State.RUNNING])
	elif player.ray_cast_front_low.is_colliding():
		state_transition_requested.emit(states[Player.State.CLIMBING])

func on_unhandled_key_input(event: InputEvent) -> void:
	super.on_unhandled_key_input(event)

	if event.is_action_pressed("jump") and not player.coyote_timer.is_stopped():
		state_transition_requested.emit(states[Player.State.JUMPING])
