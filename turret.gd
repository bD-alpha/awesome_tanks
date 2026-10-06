@abstract
class_name Turret
extends Node2D

signal on_shoot(object: Node2D)

@export var id: StringName
@export var muzzle: Array[Node2D] = []
@export var reload: float

@abstract func shoot()

var _reload_timer: float = 0.0

func _process(delta: float) -> void:
	if Input.is_action_pressed("fire") and _reload_timer <= 0:
		_reload_timer = reload
		shoot()
	_reload_timer -= delta
