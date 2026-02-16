class_name ConstantMoveComponent
extends Node

@export
var move_vector : Vector2

@export
var move_speed : float = 10.0

func _process(delta: float) -> void:
	var node = owner as Node2D
	node.position += move_vector * move_speed * delta
