class_name RandomTimer
extends Timer

@export
var min_period : float = 1.0
@export
var max_period : float = 5.0

func _ready() -> void:
	timeout.connect(_set_random_wait_time)
	_set_random_wait_time()
	start()
	
func _set_random_wait_time() -> void:
	set_wait_time(randf_range(min_period, max_period))
