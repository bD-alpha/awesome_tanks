extends Camera2D

@export var player: Node2D

func _process(delta: float) -> void:
	global_position = player.global_position + (get_global_mouse_position() - player.global_position) * 0.25
