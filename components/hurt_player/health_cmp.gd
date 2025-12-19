class_name HealthCMP
extends Node

@export var lives := 3

func decrease_health(amount: int) -> void:
	lives -= amount
