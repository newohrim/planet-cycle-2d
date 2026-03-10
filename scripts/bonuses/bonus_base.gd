class_name BonusBase
extends Node

signal bonus_ended()

@export
var timer : Timer

func bonus_begin() -> void:
	pass

func _bonus_end() -> void:
	pass

func _ready() -> void:
	timer.timeout.connect(_bonus_end_internal)
	timer.start()
	
func _bonus_end_internal() -> void:
	_bonus_end()
	bonus_ended.emit()

func bonus_interrupt() -> void:
	timer.stop()
	_bonus_end()

func bonus_sum(other : BonusBase) -> void:
	assert(typeof(self) == typeof(other))
	timer.start(timer.time_left + other.timer.wait_time)
