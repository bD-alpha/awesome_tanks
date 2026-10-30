class_name Tank
extends CharacterBody2D

@export var turret: Turret

var movement_direction: Vector2 = Vector2.ZERO
var turret_direction: Vector2 = Vector2.RIGHT
var shooting: bool = false

var _turret_rotation: float = 0.0

func _physics_process(delta: float) -> void:
	if not movement_direction.is_zero_approx():
		rotation = rotate_toward(rotation, movement_direction.angle(), PI * 1.5 * delta)
	velocity = movement_direction.normalized() * 125
	move_and_slide()

func _process(delta: float) -> void:
	_turret_rotation = rotate_toward(_turret_rotation, turret_direction.angle(), PI * delta)
	turret.global_rotation = _turret_rotation
	
	if shooting: turret.try_shoot()
