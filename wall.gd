extends StaticBody2D

@export var group: WallGroup

func _ready() -> void:
	if group:
		group.walls.append(self)
		$Health.depleted.connect(func():
			for wall in group.walls:
				if wall != self:
					wall.queue_free()
			)
func update_cracks():
	$Sprite2D.set_instance_shader_parameter("Cracks",1.0-$Health.value/$Health.max_value)
