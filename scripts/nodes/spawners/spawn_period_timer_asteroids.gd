class_name SpawnPeriodTimerAsteroids
extends RandomTimer

@export
var min_period_on_horde = 0.1

@export
var max_period_on_horde = 0.3

@onready
var initialMinPeriod = min_period

@onready
var initialMaxPeriod = max_period

func _ready() -> void:
	super._ready()
	ProjectGlobals.player_state.state_changed.connect(_on_player_state_changed)
	
func _on_player_state_changed(flag : PlayerState.PLAYER_STATE_E, value : bool) -> void:
	if flag == PlayerState.PLAYER_STATE_E.IS_HORDE_MODE:
		if value:
			min_period = min_period_on_horde
			max_period = max_period_on_horde
		else:
			min_period = initialMinPeriod
			max_period = initialMaxPeriod
