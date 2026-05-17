extends CanvasLayer

@export
var game_lvl_scene : PackedScene

@onready
var master_bus_idx : int = AudioServer.get_bus_index("Master")

func _on_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(master_bus_idx, value)
	
func _play_button_clicked() -> void:
	SceneTraverseFade.faded_in.connect(load_game_lvl)
	SceneTraverseFade.start_fade_in()

func load_game_lvl() -> void:
	SceneTraverseFade.faded_in.disconnect(load_game_lvl)
	get_tree().change_scene_to_packed(game_lvl_scene)
