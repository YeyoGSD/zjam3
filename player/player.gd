class_name Player
extends CharacterBody2D

@export var speed := 200.0
@export var gravity := 980.0
@export var jump_force := -400.0
@export var climb_speed := -400.0

@onready var ray_cast_wall_high: RayCast2D = $RayCastWallHigh
@onready var ray_cast_wall_low: RayCast2D = $RayCastWallLow

enum State { RUNNING, FALLING ,JUMPING, SLIDING, CLIMBING }

func _ready() -> void:
	velocity = speed * Vector2.RIGHT


func _physics_process(_delta: float) -> void:
	move_and_slide()
