class_name DamageBlinkSprite
extends Sprite2D

@export
var damage_color : Color = Color.WHITE

@export
var blink_half_duration : float = 1.0

@onready
var initial_color : Color = self.modulate

var tween : Tween

func on_health_changed(_health : float, delta : float):
	if delta < 0:
		# damage received
		blink(damage_color)

func blink(target_color : Color):
	if tween:
		tween.kill()
	tween = create_tween()
	tween.set_trans(Tween.TransitionType.TRANS_SINE)
	tween.tween_property(
		self, "modulate", target_color, blink_half_duration
	)
	tween.tween_property(
		self, "modulate", initial_color, blink_half_duration
	)
