extends Node

const _USER_SAVE_DATA_PATH = "user://save.save"

signal game_over_evt()

@export var view_distance : float = 2500.0

var player_state : PlayerState

var player_score : PlayerScore

var _best_score_cached : int = 0

func game_over():
	player_score.update_best_score()
	game_over_evt.emit()
	
func get_cached_best_score() -> int:
	return _best_score_cached
	
func save_best_score(score: int) -> void:
	_best_score_cached = score
	var file = FileAccess.open(_USER_SAVE_DATA_PATH, FileAccess.WRITE)
	if not file:
		push_error("Couldn't write %s: %s" % [_USER_SAVE_DATA_PATH, error_string(FileAccess.get_open_error())])
		return
	file.store_32(_best_score_cached)

func _enter_tree() -> void:
	var file = FileAccess.open(_USER_SAVE_DATA_PATH, FileAccess.READ)
	if not file:
		push_warning("Couldn't read %s: %s" % [_USER_SAVE_DATA_PATH, error_string(FileAccess.get_open_error())])
		return
	_best_score_cached = file.get_32()
	print("parsed best score from save file: {0}".format([_best_score_cached]))
