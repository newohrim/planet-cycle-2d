class_name PlayerScore
extends Node

var _score : int = 0

var _best_score : int = 0

signal score_changed(score : int)

func add_score(amount: int):
	var new_score = max(0, _score + amount)
	if new_score != _score:
		_score = new_score
		score_changed.emit(_score)
		
func update_best_score():
	if _score > _best_score:
		_best_score = _score

func _enter_tree() -> void:
	assert(ProjectGlobals.player_score == null)
	ProjectGlobals.player_score = self
	
func _exit_tree() -> void:
	assert(ProjectGlobals.player_score == self)
	ProjectGlobals.player_score = null
