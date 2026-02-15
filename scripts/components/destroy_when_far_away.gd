extends Node

var player : Node2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	if not player:
		push_error("no player found for " + get_name())
		owner.queue_free()
		
func _process(_delta: float) -> void:
	var dist_sq = (owner as Node2D).position.distance_squared_to(player.position)
	if dist_sq > ProjectGlobals.view_distance ** 2:
		owner.queue_free()
