extends Node

signal faded_in()
signal faded_out()

@export
var colorRect : ColorRect

@export
var _fadePeriod : float = 1.0

var _tween : Tween

func start_fade_in() -> void:
	colorRect.visible = true
	if _tween:
		_tween.kill()
	_tween = create_tween()
	_tween.tween_property(colorRect, "color:a", 1.0, _fadePeriod)
	_tween.tween_callback(func(): self.faded_in.emit())
	_tween.tween_property(colorRect, "color:a", 0.0, _fadePeriod)
	_tween.tween_callback(_on_fade_out)

func _on_fade_out() -> void:
	colorRect.visible = false
	faded_out.emit()
