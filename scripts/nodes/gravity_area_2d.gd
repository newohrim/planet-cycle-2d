class_name GravityArea2D
extends Area2D

@export var max_bodies_on_orbit : int = 3
@export var orbit_radius: float = 5.0

var orbited_bodies : Array[Node2D]

func _ready() -> void:
	orbited_bodies.resize(max_bodies_on_orbit)
	
func find_free_slot() -> int:
	return orbited_bodies.find_custom(func(body): return body == null)
	
func make_orbit(body : Node2D, idx : int) -> float:
	assert(idx >= 0 and idx < max_bodies_on_orbit and orbited_bodies[idx] == null)
	
	orbited_bodies[idx] = body
	body.tree_exiting.connect(_remove_from_orbit.bind(body))
	return orbit_radius * (idx + 1)

func _remove_from_orbit(body: Node2D) -> void:
	var idx = orbited_bodies.find(body)
	if idx >= 0:
		orbited_bodies[idx] = null
