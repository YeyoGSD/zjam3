class_name SlidingState
extends PlayerStateBase

@export var animated_sprite: AnimatedSprite2D
@export var standing_collision: CollisionShape2D
@export var sliding_collision: CollisionShape2D

@export var slide: AudioStreamPlayer

#TODO: Agregar animación
func start():
	player.velocity.x = player.sliding_speed
	standing_collision.disabled = true
	sliding_collision.disabled = false
	animated_sprite.play("sliding")
	animated_sprite.position = Vector2(13, -5)
	animated_sprite.rotation = -PI/2
	slide.pitch_scale = randf_range(0.9, 1.2)
	slide.play()


func end():
	animated_sprite.rotation = 0
	animated_sprite.position = Vector2.ZERO
	standing_collision.disabled = false
	sliding_collision.disabled = true
	slide.stop()
