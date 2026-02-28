extends Node

@export
var damage_amount : float = 5.0

func _on_deal_damage(area : Area2D):
	if area is HitBoxComponent:
		area.receive_damage(self, damage_amount)
