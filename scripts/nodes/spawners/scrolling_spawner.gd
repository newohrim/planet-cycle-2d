class_name MoonSpawner
extends Node

@export 
var pivot : Node2D
@export
var position_provider : PositionProviderBase
@export
var scene_provider : SceneProvider
@export
var min_nodes_num : int = 5

var spawned_nodes : Array[Node2D]

func _ready() -> void:
	assert(pivot and position_provider)
	
func _process_spawn() -> void:
	var attempts_num = min_nodes_num - spawned_nodes.size()
	for i in range(attempts_num):
		_spawn_node()
		
func _spawn_node() -> void:
	var scene = scene_provider.get_scene()
	# TODO: check if pos overlaps pivot in some radius
	var pos = position_provider.get_global_pos(pivot)
	
	var node = scene.instantiate() as Node2D
	node.global_position = pos
	
	node.tree_exiting.connect(func(): 
		spawned_nodes.erase(node)
	)
	spawned_nodes.push_back(node)
	get_tree().get_root().add_child(node)
