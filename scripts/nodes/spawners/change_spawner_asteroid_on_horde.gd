extends Node

@export
var asteroidRed : PackedScene

var initialScenes : Array[PackedScene]

func _ready() -> void:
	initialScenes = (get_parent() as ScrollingSpawner).scene_provider.scenes.duplicate(true)
	ProjectGlobals.player_state.state_changed.connect(_on_player_state_changed)
	
func _on_player_state_changed(flag : PlayerState.PLAYER_STATE_E, value : bool) -> void:
	if flag == PlayerState.PLAYER_STATE_E.IS_HORDE_MODE:
		var spawner = get_parent() as ScrollingSpawner
		if value:
			spawner.scene_provider.scenes.assign([asteroidRed])
		else:
			spawner.scene_provider.scenes.assign(initialScenes)
