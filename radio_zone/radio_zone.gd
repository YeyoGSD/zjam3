class_name RadioZone
extends Area2D

@export_multiline var dialogue_text := "Escribe aquí tu mensaje..."

func _ready() -> void:
	body_entered.connect(func(body: Node2D):
		if body is Player:
			EventBus.radio_message_show_requested.emit(dialogue_text))
	
	body_exited.connect(func(body: Node2D):
		if body is Player:
			EventBus.radio_message_hide_requested.emit())
