class_name GravityArea2D
extends Area2D

@export var max_bodies_on_orbit : int = 3
@export var orbit_radius: float = 5.0

var orbited_bodies : Array[Node2D]

func _ready() -> void:
	orbited_bodies.resize(max_bodies_on_orbit)

func _on_area_entered(body: Area2D) -> void:
	if not body.is_in_group("orbitable"):
		return
	
	var free_idx = _find_free_slot()
	if free_idx < 0:
		return
	
	orbited_bodies[free_idx] = body
	body.tree_exiting.connect(_remove_from_orbit.bind(body))
	body.make_orbit(self, orbit_radius * (free_idx + 1))
	
func _find_free_slot() -> int:
	return orbited_bodies.find_custom(func(body): return not is_instance_valid(body))

func _remove_from_orbit(body: Node2D) -> void:
	var idx = orbited_bodies.find(body)
	if idx >= 0:
		orbited_bodies[idx] = null
