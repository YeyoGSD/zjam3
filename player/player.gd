class_name Player
extends CharacterBody2D

@export var default_speed := 200.0
@export var gravity := 980.0
@export var jump_force := -400.0
@export var climb_speed := -400.0

@onready var ray_cast_wall_high: RayCast2D = $RayCastWallHigh
@onready var ray_cast_wall_low: RayCast2D = $RayCastWallLow
@onready var health_cmp: HealthCMP = $HealthCMP

var running_speed: float
var sliding_speed: float

enum State { RUNNING, FALLING ,JUMPING, SLIDING, CLIMBING }

func _connect_signals() -> void:
	EventBus.player_got_hurt.connect(func(damage: int):
		health_cmp.decrease_health(damage)
		match health_cmp.lives:
			2: running_speed = default_speed - 50
			3: running_speed = default_speed - 100
		)


func _set_speeds() -> void:
	running_speed = default_speed
	sliding_speed = running_speed + 50


func _ready() -> void:
	_set_speeds()


func _physics_process(_delta: float) -> void:
	move_and_slide()
