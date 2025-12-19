class_name Player
extends CharacterBody2D

@export var speed := 200.0
@export var gravity := 980.0
@export var jump_force := -400.0
@export var climb_speed := -400.0

@onready var ray_cast_wall_high: RayCast2D = $RayCastWallHigh
@onready var ray_cast_wall_low: RayCast2D = $RayCastWallLow
@onready var health_cmp: HealthCMP = $HealthCMP

enum State { RUNNING, FALLING ,JUMPING, SLIDING, CLIMBING }

func _ready() -> void:
	_connect_signals()
	velocity = speed * Vector2.RIGHT


func _connect_signals() -> void:
	EventBus.player_got_hurt.connect(func(damage: int):
		health_cmp.decrease_health(damage)
		match health_cmp.lives:
			2: speed = 150.0
			1: speed = 100.0
	)


func _physics_process(_delta: float) -> void:
	move_and_slide()
