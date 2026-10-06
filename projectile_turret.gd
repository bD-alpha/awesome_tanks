extends "res://turret.gd"

@export var damage: float
@export var projectile_speed: float
@export var distance: float
@export var projectile_texture: Texture2D
@export var spread: float
@export var features: Array[PackedScene] = []

func shoot():
	for muzzle in muzzle:
		var projectile = Projectile.new()
		projectile.damage = damage
		projectile.distance = distance
		projectile.speed = projectile_speed
		projectile.direction = muzzle.global_transform.x
		projectile.global_position = muzzle.global_position
		
		var sprite = Sprite2D.new()
		sprite.texture = projectile_texture
		projectile.add_child(sprite)
		
		get_tree().current_scene.add_child(projectile)
		on_shoot.emit(projectile)
