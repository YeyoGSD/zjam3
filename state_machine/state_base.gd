class_name StateBase
extends Node

@warning_ignore("unused_signal")
signal state_transition_requested(new_state: StateBase)

func start():
	pass
	
func end():
	pass

func on_process(_delta: float) -> void:
	pass

func on_physics_process(_delta: float) -> void:
	pass

func on_input(_event: InputEvent) -> void:
	pass

func on_unhandled_input(_event: InputEvent) -> void:
	pass

func on_unhandled_key_input(_event: InputEvent) -> void:
	pass
