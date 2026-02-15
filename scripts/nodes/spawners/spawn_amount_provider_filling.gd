class_name SpawnAmountProviderFilling
extends SpawnAmountProviderBase

@export
var target_amount : int = 5

func get_spawn_amount(current_amount : int) -> int:
	return max(target_amount - current_amount, 0)
