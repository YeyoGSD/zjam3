extends Control

@onready var label: Label = $Panel/HBoxContainer/TextContainer/DialogueLabel
@onready var animation_player := $AnimationPlayer as AnimationPlayer

func _ready() -> void:
	EventBus.radio_message_show_requested.connect(show_message)
	EventBus.radio_message_hide_requested.connect(hide_message)


func show_message(text_to_show: String):
	label.text = text_to_show
	if visible == false:
		animation_player.play("show")
		visible = true


func hide_message():
	if visible == true:
		animation_player.play("hide")
		visible = false
