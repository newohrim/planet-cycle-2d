class_name PowerComponent
extends Node

signal power_received(power : float, delta : float)

const MAX_POWER_VALUE : float = 100.0

var power : float = 0.0

func is_powered() -> bool:
	return power == MAX_POWER_VALUE

func add_power_from_node(_from : Node, amount : float) -> void:
	add_power(amount)

func add_power(amount : float) -> void:
	var new_power = min(power + amount, MAX_POWER_VALUE)
	if new_power == power:
		return
	power = new_power
	power_received.emit(power, amount)
