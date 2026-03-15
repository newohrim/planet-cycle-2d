class_name HealthComponent
extends Node

signal health_changed(health : float, delta : float)

@export
var start_health : float = 100.0

@onready
var health : float = start_health

func apply_damage(_from : Node, damage : float) -> void:
	if health == 0.0 or\
	 not ProjectGlobals.player_state.is_alive() or\
	 ProjectGlobals.player_state.is_ignore_damage():
		return
	assert(damage >= 0.0, "received negative damage")
	var new_health = max(health - damage, 0)
	if new_health == health:
		return
	health = new_health
	health_changed.emit(health, -damage)
	
func apply_heal(_from : Node, heal : float) -> void:
	if health == start_health or not ProjectGlobals.player_state.is_alive():
		return
	assert(heal >= 0.0, "received negative heal")
	var new_health = min(health + heal, start_health)
	if new_health == health:
		return
	health = new_health
	health_changed.emit(health, heal)
