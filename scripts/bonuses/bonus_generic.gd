class_name BonusGeneric
extends BonusBase

@export
var target_state : Array[PlayerState.PLAYER_STATE_E]

func bonus_begin() -> void:
	for state in target_state:
		ProjectGlobals.player_state.set_bit(state)
	
func _bonus_end() -> void:
	for state in target_state:
		ProjectGlobals.player_state.clear_bit(state)
