extends SlidingState

@export var slide_duration := 1.5 #Temporal, probablemente lo mueva al padre cuando tenga animaciones

func start():
	super.start()
	get_tree().create_timer(slide_duration).timeout.connect(func():
		state_transition_requested.emit(states[Player.State.RUNNING]))
