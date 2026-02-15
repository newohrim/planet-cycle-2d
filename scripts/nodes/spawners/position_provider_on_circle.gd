class_name PositionProviderOnCircle
extends PositionProviderBase

@export var radius : float = 500.0

func get_global_pos(pivot : Node2D) -> Vector2:
	var angle_rad = randf() * TAU
	return pivot.global_position + \
		radius * Vector2(cos(angle_rad), sin(angle_rad))
