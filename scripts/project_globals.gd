extends Node

signal game_over_evt()

@export var view_distance : float = 2500.0

var player_state : PlayerState

var player_score : PlayerScore

func game_over():
	game_over_evt.emit()
