class_name HealthBar
extends TextureProgressBar

@export
var healthChangeSpeed = 10.0

@export
var tween_blinker : TweenBlinker

var target_health : float = 100.0

func _ready() -> void:
	assert(tween_blinker)
	tween_blinker.initial_color = self.tint_progress
	ProjectGlobals.player_state.state_changed.connect(_on_player_state_changed)

func on_health_changed(health : float, _delta : float):
	target_health = health

func _process(delta: float) -> void:
	if target_health == 0.0:
		set_value(0.0)  # progress bar value doesn't go lower than 3.0 for some reason
	else:
		set_value(lerp(get_value(), target_health, healthChangeSpeed * delta))
		
func _on_player_state_changed(state_flag : PlayerState.PLAYER_STATE_E, bit_value : bool):
	if state_flag == PlayerState.PLAYER_STATE_E.IS_HEALING:
		if bit_value:
			tween_blinker.blink(self, "tint_progress")
		else:
			tween_blinker.stop()
