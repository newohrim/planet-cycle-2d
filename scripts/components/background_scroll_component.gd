class_name BackgroundScrollComponent
extends Node

@export var target_background : Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var camera = get_viewport().get_camera_2d()
	if !camera:
		return
	var camera_pos = camera.get_global_transform().origin# + camera.offset
	print(target_background.region_rect.position)
	target_background.region_rect.position = camera_pos
