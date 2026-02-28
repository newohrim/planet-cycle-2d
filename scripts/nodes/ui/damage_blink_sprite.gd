class_name DamageBlinkSprite
extends Sprite2D

@export
var tween_blinker : TweenBlinker

@onready
var initial_color : Color = Color.WHITE

func _ready() -> void:
	tween_blinker.initial_color = self.modulate

func on_health_changed(_health : float, delta : float):
	if delta < 0:
		# damage received
		tween_blinker.blink(self, "modulate")
