class_name AddScoreComponent
extends Node

func _on_damage_received(_from : Node, _damage : float):
	# TODO: check if from node is asteroid?
	if ProjectGlobals.player_state.is_invulnerable():
		ProjectGlobals.player_score.add_score(1)
