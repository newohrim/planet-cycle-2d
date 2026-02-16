class_name HitBoxComponent
extends Area2D

signal damage_received(from : Node, damage : float)

func receive_damage(from : Node, damage : float) -> void:
	damage_received.emit(from, damage)
