class_name SpawnAmountProviderAsteroids
extends SpawnAmountProviderConstant

@export
var amount_on_horde = 10

@onready
var initialAmount = amount

func _ready() -> void:
	ProjectGlobals.player_state.state_changed.connect(_on_player_state_changed)
	
func _on_player_state_changed(flag : PlayerState.PLAYER_STATE_E, value : bool) -> void:
	if flag == PlayerState.PLAYER_STATE_E.IS_HORDE_MODE:
		amount = amount_on_horde if value else initialAmount
