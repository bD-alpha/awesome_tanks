@tool
extends AtomicState

@export var tank: Tank
@export var navigator: NavigationAgent2D

var _target_point: Vector2

func _ready() -> void:
	super._ready()
	state_entered.connect(state_enter)
	state_processing.connect(state_process)

func state_enter() -> void:
	_target_point = tank.global_position + Vector2.from_angle(randf() * TAU) * randf_range(100, 800)
	navigator.target_position = _target_point
	while not navigator.is_target_reachable():
		_target_point = tank.global_position + Vector2.from_angle(randf() * TAU) * randf_range(100, 800)
		navigator.target_position = _target_point

func state_process(_delta: float) -> void:
	tank.movement_direction = tank.global_position.direction_to(navigator.get_next_path_position())
	tank.turret_direction = tank.movement_direction
