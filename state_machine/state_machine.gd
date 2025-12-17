class_name StateMachine
extends Node

@export var default_state: StateBase

var current_state: StateBase:
	set(new_state):
		current_state = new_state
		call_deferred("_start_current_state")

func _ready() -> void:
	current_state = default_state
	for child_state in get_children() as Array[StateBase]:
		child_state.state_transition_requested.connect(_switch_state)

func _start_current_state() -> void:
	current_state.start()

func _switch_state(new_state: StateBase) -> void:
	if current_state:
		current_state.end()
	current_state = new_state
	print("Current State: ", current_state)

func _process(delta: float) -> void:
	if current_state:
		current_state.on_process(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.on_physics_process(delta)

func _input(event: InputEvent) -> void:
	if current_state:
		current_state.on_input(event)

func _unhandled_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_unhandled_input(event)

func _unhandled_key_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_unhandled_key_input(event)
