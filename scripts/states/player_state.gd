class_name PlayerState
extends Node

signal state_changed(state_flag : PLAYER_STATE_E, value : bool)

enum PLAYER_STATE_E {
	IS_DEAD = 1 << 0,
	IS_INVULNERABLE = 1 << 1,
	
	DEFAULT = 0
}

var flags : int = PLAYER_STATE_E.DEFAULT

func is_alive() -> bool:
	return not _is_bit_set(PLAYER_STATE_E.IS_DEAD)
	
func is_invulnerable() -> bool:
	return _is_bit_set(PLAYER_STATE_E.IS_INVULNERABLE)

func set_bit(bit : PLAYER_STATE_E) -> void:
	assert(flags & bit == 0, str(bit) + " bit was already set")
	flags |= bit
	state_changed.emit(bit, true)
	
func clear_bit(bit : PLAYER_STATE_E) -> void:
	assert(flags & bit == bit, str(bit) + " bit wasn't set")
	flags &= ~bit
	state_changed.emit(bit, false)

func _is_bit_set(bit : PLAYER_STATE_E) -> bool:
	return bool(flags & bit)

func _enter_tree() -> void:
	ProjectGlobals.player_state = self
	
func _exit_tree() -> void:
	ProjectGlobals.player_state = null
