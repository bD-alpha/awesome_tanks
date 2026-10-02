class_name Projectile
extends PhysicsBody2D

var damage: float
var speed: float
var direction: Vector2
var distance: float

var distance_travelled: float = 0 

func _init() -> void:
	pass

func _ready() -> void:
	pass
	
	
	
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		pass
	else:
		distance_travelled += speed * delta
		if distance_travelled >= distance:
			expire()
	

func _process(delta: float) -> void:
	pass

func expire():
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0, 0.1)
	tween.tween_callback(queue_free)
