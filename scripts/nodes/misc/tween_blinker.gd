class_name TweenBlinker
extends Node

@export
var loop : bool = false

@export
var blink_half_duration : float = 1.0

@export
var target_color : Color

var initial_color : Color

var tween : Tween

func blink(obj : Node, property : NodePath):
	if tween:
		tween.kill()
	tween = create_tween()
	if loop:
		tween.set_loops()
	tween.set_trans(Tween.TransitionType.TRANS_SINE)
	tween.tween_property(
		obj, property, target_color, blink_half_duration
	)
	tween.tween_property(
		obj, property, initial_color, blink_half_duration
	)
