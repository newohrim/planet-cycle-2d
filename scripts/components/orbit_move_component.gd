class_name OrbitMoveComponent
extends Node

signal orbit_begin()

@export
var target : Node2D

@export 
var move_speed : float = 1.0

@export
var catch_up_distance : float = 10

@export
var catch_up_speed : float = 10.0

@export
var catch_up_acceleration : float = 5.0

@onready
var catch_up_distance_sq : float = pow(catch_up_distance, 2.0)

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
	var dir_inv = (owner as Node2D).global_position - _target.global_position
	cur_angle = dir_inv.angle()
	orbit_begin.emit()
	set_process(true)

func _ready() -> void:
	if !target:
		set_process(false)

func _process(delta: float) -> void:
	cur_angle += move_speed * delta
	
	var owner_2d = owner as Node2D
	var target_pos = _get_orbital_pos()
	var dist_to_target_sq = owner_2d.position.distance_squared_to(target_pos)
	if dist_to_target_sq > catch_up_distance_sq:
		owner_2d.position = owner_2d.position.lerp(
			target_pos, catch_up_speed * delta)
		catch_up_speed += catch_up_acceleration * delta
		dist_to_target_sq = owner_2d.position.distance_squared_to(target_pos)
		if dist_to_target_sq > catch_up_distance_sq:
			return
	catch_up_distance_sq = INF
	owner_2d.position = target_pos
	
func _get_orbital_pos() -> Vector2:
	var offset = Vector2(cos(cur_angle), sin(cur_angle))
	return target.global_position + offset * radius
