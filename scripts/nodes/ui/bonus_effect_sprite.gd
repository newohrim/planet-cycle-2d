extends AnimatedSprite2D

func _ready() -> void:
	ProjectGlobals.player_state.state_changed.connect(_on_state_changed)
	
func _on_state_changed(state : PlayerState.PLAYER_STATE_E, value : bool) -> void:
	if state == PlayerState.PLAYER_STATE_E.IS_INVULNERABLE:
		set_visible(value)
