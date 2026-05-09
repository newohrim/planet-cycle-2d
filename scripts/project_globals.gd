extends Node

@export var view_distance : float = 2500.0

var player_state : PlayerState

var player_score : PlayerScore

func game_over():
	get_tree().reload_current_scene()
