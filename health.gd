class_name Health
extends Node

signal damaged
signal depleted

@export var max_value: float
@export var damage_blink: bool

var value: float
var blink_tween: Tween = null

func _ready() -> void:
	value = max_value
	
func damage(amount: float):
	value-= amount
	damaged.emit()
	
	if damage_blink:
		if blink_tween:
			blink_tween.custom_step(0.1)
			blink_tween.kill()
		var r = randf_range(-0.2, 0.2)
		blink_tween = create_tween().set_parallel().set_trans(Tween.TRANS_CUBIC)
		blink_tween.tween_property(get_parent(), "modulate", Color.WHITE*2, 0.05)
		blink_tween.tween_property(get_parent(), "scale", Vector2.ONE*1.1, 0.05)
		blink_tween.tween_property(get_parent(), "rotation", r, 0.05).as_relative()
		blink_tween.chain()
		blink_tween.tween_property(get_parent(), "modulate", Color.WHITE, 0.05)
		blink_tween.tween_property(get_parent(), "scale", Vector2.ONE, 0.05)
		blink_tween.tween_property(get_parent(), "rotation", -r, 0.05).as_relative()
	if value <= 0:
		depleted.emit()
