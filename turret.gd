@abstract
extends Node2D


@export var id: StringName
@export var muzzle: Array[Node2D] = [] 

@abstract func shoot()
