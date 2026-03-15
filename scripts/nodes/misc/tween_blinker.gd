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

var object : Object

var prop : NodePath

func blink(obj : Node, property : NodePath):
	stop()
	object = obj
	prop = property
	tween = create_tween()
	if loop:
		tween.set_loops()
	tween.set_trans(Tween.TransitionType.TRANS_SINE)
	tween.tween_property(
		object, prop, target_color, blink_half_duration
	)
	tween.tween_property(
		object, prop, initial_color, blink_half_duration
	)

func stop():
	if tween:
		tween.kill()
	if object:
		assert(prop)
		print(str(prop))
		object.set(str(prop), initial_color)
		object = null
		prop = NodePath()
