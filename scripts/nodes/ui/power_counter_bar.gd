extends TextureProgressBar

@export
var tween_blinker : TweenBlinker

func _ready() -> void:
	tween_blinker.initial_color = self.tint_progress
	value_changed.connect(_on_value_changed)

func _on_power_received(power : float, _delta : float) -> void:
	set_value(power)
	
func _on_value_changed(_value : float) -> void:
	if _value == max_value:
		tween_blinker.blink(self, "tint_progress")
