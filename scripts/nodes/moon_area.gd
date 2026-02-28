class_name MoonArea
extends Area2D

signal power_received(from : Node, amount : float)

func _on_receive_power(from : Node, amount : float) -> void:
	power_received.emit(from, amount)
