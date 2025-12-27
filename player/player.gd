class_name Player
extends CharacterBody2D

@export var default_speed := 200.0
@export var gravity := 980.0
@export var jump_force := -200.0
@export var climb_speed := -200.0

@onready var ray_cast_front_low := $RayCastFrontLow as RayCast2D
@onready var ray_cast_front_high := $RayCastFrontHigh as RayCast2D
@onready var ray_cast_top_left := $RayCastTopLeft as RayCast2D
@onready var animated_sprite_2d := $AnimatedSprite2D as AnimatedSprite2D
@onready var health_cmp := $HealthCMP as HealthCMP
@onready var hurt: AudioStreamPlayer = $Hurt
@onready var coyote_timer: Timer = $CoyoteTimer

var running_speed: float
var sliding_speed: float

enum State { RUNNING, FALLING ,JUMPING, SLIDING, CLIMBING }

func recieve_damage(damage: int):
	var tween := create_tween()
	tween.tween_property(animated_sprite_2d, "modulate", Color.RED, 0.1)
	tween.tween_property(animated_sprite_2d, "modulate", Color.WHITE, 0.1)
	hurt.pitch_scale = randf_range(0.9, 1.2 )
	hurt.play()
	health_cmp.decrease_health(damage)
	EventBus.player_lives_changed.emit(health_cmp.lives)
	match health_cmp.lives:
		2:
			_set_speeds(default_speed - 25)
			EventBus.player_first_hit.emit()
		1: _set_speeds(default_speed - 50)
		0: EventBus.player_died.emit()


func _connect_signals() -> void:
	EventBus.player_got_hurt.connect(recieve_damage)


func _set_speeds(base_speed: float) -> void:
	running_speed = base_speed
	sliding_speed = running_speed + 50


func _ready() -> void:
	_set_speeds(default_speed)
	_connect_signals()


func _physics_process(_delta: float) -> void:
	move_and_slide()
