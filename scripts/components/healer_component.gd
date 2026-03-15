class_name HealerComponent
extends Node

@export
var heal_rate : float = 10.0

@export
var target_health : HealthComponent

func _ready() -> void:
	assert(target_health)
	process_mode = Node.PROCESS_MODE_DISABLED # shouldn't ever heal from the start
	ProjectGlobals.player_state.state_changed.connect(_on_player_state_changed)
	
func _on_player_state_changed(state_flag : PlayerState.PLAYER_STATE_E, value : bool):
	if state_flag == PlayerState.PLAYER_STATE_E.IS_HEALING:
		if value:
			process_mode = Node.PROCESS_MODE_INHERIT
		else:
			process_mode = Node.PROCESS_MODE_DISABLED
			
func _process(delta: float) -> void:
	target_health.apply_heal(self, heal_rate * delta)
