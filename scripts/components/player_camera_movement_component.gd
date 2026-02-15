class_name PlayerCameraMovementComponent
extends Camera2D

@export var move_speed : float = 1.0
@export var max_distance_pix_h : float = 500
@export var min_offset_pix : float = 50.0

@onready
var min_offset_pix_sq : float = min_offset_pix ** 2

var max_distance_pix_v : float = max_distance_pix_h
var target_offset : Vector2

func _ready() -> void:
	var viewport_size = get_viewport().size
	if is_zero_approx(viewport_size.x):
		viewport_size.x = 1.0
	var aspect_ratio = float(viewport_size.y) / viewport_size.x
	max_distance_pix_v = max_distance_pix_h * aspect_ratio

func _process(delta: float) -> void:
	var new_target_offset = get_local_mouse_position()
	if new_target_offset.length_squared() >= min_offset_pix_sq:
		var bounds = Vector2(max_distance_pix_h, max_distance_pix_v)
		target_offset = new_target_offset.clamp(-bounds, bounds)
	else:
		target_offset = Vector2.ZERO
	
	offset = offset.lerp(target_offset, move_speed * delta)
