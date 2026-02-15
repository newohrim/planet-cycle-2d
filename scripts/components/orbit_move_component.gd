class_name OrbitMoveComponent
extends Node

@export var move_speed : float = 1.0

var target : Node2D
var cur_angle : float = 0.0  # in radians
var radius : float

func begin_orbit(_target : Node2D, _radius : float) -> void:
	target = _target
	radius = _radius
	set_process(true)

func _ready() -> void:
	pass
	#if !target:
	#	set_process(false)

func _process(delta: float) -> void:
	if !target:
		return
	
	cur_angle += move_speed * delta
	
	var owner_2d = owner as Node2D
	owner_2d.position = _get_orbital_pos()
	
func _get_orbital_pos() -> Vector2:
	var offset = Vector2(cos(cur_angle), sin(cur_angle))
	return target.global_position + offset * radius
