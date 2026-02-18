class_name HealthBar
extends TextureProgressBar

@export
var healthChangeSpeed = 10.0

var target_health : float = 100.0

func on_health_changed(health : float, _delta : float):
	target_health = health

func _process(delta: float) -> void:
	if target_health == 0.0:
		set_value(0.0)  # progress bar value doesn't go lower than 3.0 for some reason
	else:
		set_value(lerp(get_value(), target_health, healthChangeSpeed * delta))
