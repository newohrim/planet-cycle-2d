class_name PlayerScore
extends Node

signal score_changed(score : int)

var _score : int = 0

# TODO: move to globals?
@onready
var _best_score : int = ProjectGlobals.get_cached_best_score()

func get_score() -> int:
	return _score

func add_score(amount: int):
	var new_score = max(0, _score + amount)
	if new_score != _score:
		_score = new_score
		score_changed.emit(_score)
		
func get_best_score() -> int:
	return _best_score
		
func update_best_score():
	if _score > _best_score:
		_best_score = _score
		ProjectGlobals.save_best_score(_best_score)

func _enter_tree() -> void:
	assert(ProjectGlobals.player_score == null)
	ProjectGlobals.player_score = self
	
func _exit_tree() -> void:
	assert(ProjectGlobals.player_score == self)
	ProjectGlobals.player_score = null
	
