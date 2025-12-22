extends SlidingState

@export var slide_duration := 1.5 #Temporal, probablemente lo mueva al padre cuando tenga animaciones

var timer_timeout: bool
var can_standup: bool

func _flags_to_false() -> void:
	timer_timeout = false
	can_standup = false

func start():
	super.start()

	_flags_to_false()
	get_tree().create_timer(slide_duration).timeout.connect(func():
		timer_timeout = true)


func end():
	super.end()
	
	_flags_to_false()


func on_physics_process(delta: float) -> void:
	super.on_physics_process(delta)
	
	can_standup = !player.ray_cast_top_left.is_colliding()
	if timer_timeout and can_standup:
		state_transition_requested.emit(states[Player.State.RUNNING])
