class_name RadioZone
extends Area2D

@export_multiline var dialogue_text := "Escribe aquí tu mensaje..."

func _ready() -> void:
	area_entered.connect(func(area: Area2D):
		if area.name == "BodySensor":
			EventBus.radio_message_show_requested.emit(dialogue_text))
	
	area_exited.connect(func(area: Area2D):
		if area.name == "BodySensor":
			EventBus.radio_message_hide_requested.emit())
