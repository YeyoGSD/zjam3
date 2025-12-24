class_name SlidingState
extends PlayerStateBase

@export var standing_collision: CollisionShape2D
@export var sliding_collision: CollisionShape2D

#TODO: Agregar animación
func start():
	player.velocity.x = player.sliding_speed
	standing_collision.disabled = true
	sliding_collision.disabled = false


func end():
	standing_collision.disabled = false
	sliding_collision.disabled = true
