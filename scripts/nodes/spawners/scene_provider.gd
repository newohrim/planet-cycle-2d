class_name SceneProvider
extends Node

@export
var scenes : Array[PackedScene]

func get_scene() -> PackedScene:
	assert(not scenes.is_empty())
	return scenes[randi_range(0, scenes.size() - 1)]
