class_name PlayerMoveComponent
extends Node

@export var move_speed : float = 1.0
@export var max_speed_px : float = 100.0
@export var move_threshold_pix : int = 10

var move_threshold_2 : float = 0.0

var target_pos : Vector2 = Vector2.ZERO

func _ready() -> void:
	move_threshold_2 = move_threshold_pix * move_threshold_pix
	target_pos = (owner as Node2D).position

func _process(delta: float) -> void:
	var owner_2d : Node2D = owner
	
	var camera = get_viewport().get_camera_2d() # Or any node with get_canvas_transform()
	var mouse_pos = get_viewport().get_mouse_position()
	var world_position = camera.get_canvas_transform().affine_inverse() * mouse_pos

	var move_dir = world_position - owner_2d.position
	var move_dir_len_2 = move_dir.length_squared()
	if move_dir_len_2 >= move_threshold_2:
		target_pos = world_position
	
	# owner_2d.position += move_dir_norm * move_speed * delta
	owner_2d.position = owner_2d.position.lerp(target_pos, max_speed_px * delta)
	
func _get_screen_center() -> Vector2:
	return get_viewport().size / 2.0
