@abstract
class_name Turret
extends Node2D

signal on_shoot(object: Node2D)

@export var id: StringName
@export var muzzle: Array[Node2D] = []
@export var reload: float

@abstract func shoot()

var _reload_timer: float = 0.0

func try_shoot() -> bool:
	if _reload_timer <= 0:
		_reload_timer = reload
		shoot()
		return true
	return false

func _process(delta: float) -> void:
	_reload_timer -= delta
