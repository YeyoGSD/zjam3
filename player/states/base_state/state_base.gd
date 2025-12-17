class_name PlayerStateBase
extends StateBase

@export var player: Player

@onready var states: Dictionary[Player.State, PlayerStateBase] = {
	Player.State.RUNNING: %RunningState,
	Player.State.FALLING: %FallingState,
	Player.State.JUMPING: %JumpingState,
	Player.State.SLIDING: %SlidingState,
	Player.State.CLIMBING: %ClimbingState
}
