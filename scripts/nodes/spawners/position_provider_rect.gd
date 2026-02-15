class_name PositionProviderRect
extends PositionProviderBase

@export var half_width : float = 100
@export var half_height : float = 100

func get_global_pos(pivot : Node2D) -> Vector2:
	var offset = Vector2(
		get_single_component(half_width), get_single_component(half_height)
	)
	return pivot.global_position + offset

func get_single_component(half_bound : float) -> float:
	return randf() * (half_bound * 2) - half_bound
