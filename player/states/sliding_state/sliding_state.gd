class_name SlidingState
extends PlayerStateBase

@export var sprite: Sprite2D
@export var standing_collision: CollisionShape2D
@export var sliding_collision: CollisionShape2D

func _switch_collision_disabled() -> void:
	standing_collision.disabled = !standing_collision.disabled
	sliding_collision.disabled = !sliding_collision.disabled

# Manipulacion de sprite temporal hasta que tenga las animaciones

func start():
	_switch_collision_disabled()
	sprite.offset = Vector2(64,0)
	sprite.rotate(-PI/2)


func end():
	_switch_collision_disabled()
	sprite.offset = Vector2(0,-64)
	sprite.rotate(PI/2)
