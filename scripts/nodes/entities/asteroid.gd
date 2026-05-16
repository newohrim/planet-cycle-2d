class_name Asteroid
extends Node2D

@export
var particle_on_hit : PackedScene

@onready
var move_comp : ConstantMoveComponent = %MoveComponent

@onready
var asteroid_area : Area2D = %AsteroidArea

@onready
var visible_notifier : VisibleOnScreenNotifier2D = %VisibleOnScreenNotifier2D

func _ready() -> void:
	var player = get_tree().get_first_node_in_group("player")
	if not player:
		queue_free()
		return
	
	move_comp.move_vector = position.direction_to((player as Node2D).position)
	asteroid_area.area_entered.connect(_on_hit)
	
func _on_hit(area : Area2D) -> void:
	if area is MoonArea and visible_notifier.is_on_screen():
		var particle = particle_on_hit.instantiate() as GPUParticles2D
		particle.global_position = global_position
		particle.finished.connect(func(): particle.queue_free())
		particle.emitting = true
		get_tree().current_scene.add_child(particle)
	queue_free()
