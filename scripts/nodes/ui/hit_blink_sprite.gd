class_name HitBlinkSprite
extends Sprite2D

@export
var tween_blinker : TweenBlinker

@onready
var initial_color : Color = Color.WHITE

func _ready() -> void:
	tween_blinker.initial_color = self.modulate

func _on_damage_received(_from : Node, amount : float):
	if amount > 0.0:
		# damage received
		tween_blinker.blink(self, "modulate")
