class_name OrbitableArea2D
extends Area2D

@export var move_component : OrbitMoveComponent

func make_orbit(target_area : GravityArea2D, orbit_radius : float):
	move_component.begin_orbit(target_area, orbit_radius)
