class_name  HurtPlayerCMP
extends Node

@export var hitbox: Area2D
@export var damage := 1

func _ready() -> void:
	hitbox.body_entered.connect(func(_body: Node2D):
		EventBus.player_got_hurt.emit(damage))
