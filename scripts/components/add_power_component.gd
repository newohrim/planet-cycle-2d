extends Node

@export
var power_amount : float = 100.0 / 8.0

func _on_add_power(area : Area2D) -> void:
	if area is MoonArea:
		area._on_receive_power(self, power_amount)
