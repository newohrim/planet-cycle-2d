class_name OrbitMoveComponent
extends Node

signal orbit_begin()

@export
var target : Node2D

@export 
var move_speed : float = 1.0

var cur_angle : float = 0.0  # in radians
var radius : float

func _on_area_entered(area : Area2D) -> void:
	if area is GravityArea2D:
		var free_idx = area.find_free_slot()
		if free_idx < 0:
			return
		var _radius = area.make_orbit(owner, free_idx)
		begin_orbit(area, _radius)

func begin_orbit(_target : Node2D, _radius : float) -> void:
	target = _target
	radius = _radius
	orbit_begin.emit()
	set_process(true)

func _ready() -> void:
	if !target:
		set_process(false)

func _process(delta: float) -> void:
	cur_angle += move_speed * delta
	
	var owner_2d = owner as Node2D
	owner_2d.position = _get_orbital_pos()
	
func _get_orbital_pos() -> Vector2:
	var offset = Vector2(cos(cur_angle), sin(cur_angle))
	return target.global_position + offset * radius
