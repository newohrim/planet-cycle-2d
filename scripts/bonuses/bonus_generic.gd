class_name BonusGeneric
extends BonusBase

@export
var target_state : Array[PlayerState.PLAYER_STATE_E]

func is_same_bonus_type(_other : BonusBase) -> bool:
	if not _other is BonusGeneric:
		return false
	# assuming different bonuses don't share same target states
	return (_other as BonusGeneric).target_state == target_state

func bonus_begin() -> void:
	for state in target_state:
		ProjectGlobals.player_state.set_bit(state)
	
func _bonus_end() -> void:
	for state in target_state:
		ProjectGlobals.player_state.clear_bit(state)
