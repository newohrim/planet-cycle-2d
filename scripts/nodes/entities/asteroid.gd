class_name Asteroid
extends Node2D

@onready
var move_comp : ConstantMoveComponent = %MoveComponent

@onready
var deal_damage_area : DealDamageArea2D = %DealDamageArea

func _ready() -> void:
	var player = get_tree().get_first_node_in_group("player")
	if not player:
		queue_free()
		return
	
	move_comp.move_vector = position.direction_to((player as Node2D).position)
	deal_damage_area.area_entered.connect(func(_area): queue_free())
