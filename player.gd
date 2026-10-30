extends Node

@export var turrets: Array [Turret] = []

@onready var tank: Tank = get_parent()

var active_turret = 0
var input_direction = Vector2.ZERO
var turret_rotation = 0 

func _ready() -> void:
	tank.turret = turrets[active_turret]
	for turret in turrets:
		turret.on_shoot.connect(func (object: Node2D):
			object.collision_layer = 0
			object.collision_mask = 0b101
		)

func _process(delta: float) -> void:
	tank.movement_direction.x = Input.get_axis("left","right")
	tank.movement_direction.y = Input.get_axis("up","down")
	if  not input_direction.is_zero_approx():
		input_direction = input_direction.normalized()
		
	var mouse_position = tank.get_global_mouse_position() - tank.global_position
	tank.turret_direction = mouse_position.normalized()
	
	tank.shooting = Input.is_action_pressed("fire")
		
