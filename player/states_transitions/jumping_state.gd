extends JumpingState

func start():
	super.start()
	state_transition_requested.emit(states[Player.State.FALLING])
