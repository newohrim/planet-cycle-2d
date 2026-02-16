class_name HealthComponent
extends Node

@export
var start_health : float = 100.0

@onready
var health : float = start_health

func apply_damage(_from : Node, damage : float) -> void:
	assert(damage >= 0.0, "received negative damage")
	health = max(health - damage, 0)
	print("health: " + str(health))
