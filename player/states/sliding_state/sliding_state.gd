class_name SlidingState
extends PlayerStateBase

@export var standing_collision: CollisionShape2D
@export var sliding_collision: CollisionShape2D

func _switch_collision_disabled() -> void:
	standing_collision.disabled = !standing_collision.disabled
	sliding_collision.disabled = !sliding_collision.disabled


#TODO: Agregar animación
func start():
	player.velocity.x = player.sliding_speed
	_switch_collision_disabled()


func end():
	_switch_collision_disabled()
