class_name DealDamageArea2D
extends Area2D

@export
var damage_amount : float = 5.0

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	
func _on_area_entered(area: Area2D) -> void:
	if area is HitBoxComponent:
		area.receive_damage(self, damage_amount)
