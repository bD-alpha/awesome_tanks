extends CharacterBody2D

@export var turrets: Array [Turret] = []

var active_turret = 0
var input_direction = Vector2.ZERO
var turret_rotation = 0 

func _ready() -> void:
	for turret in turrets:
		turret.on_shoot.connect(func (object: Node2D):
			object.collision_layer = 0
			object.collision_mask = 0b101
		)

func _physics_process(delta: float) -> void:
	if  not input_direction.is_zero_approx():
		rotation = rotate_toward(rotation, input_direction.angle(), PI * 1.5 * delta)
	velocity = input_direction * 125
	move_and_slide()

func _process(delta: float) -> void:
	input_direction.x = Input.get_axis("left","right")
	input_direction.y = Input.get_axis("up","down")
	if  not input_direction.is_zero_approx():
		input_direction = input_direction.normalized()
	var mouse_position = get_global_mouse_position() - global_position
	turret_rotation = rotate_toward(turret_rotation, mouse_position.angle(), PI * delta)
	turrets[active_turret].global_rotation = turret_rotation
