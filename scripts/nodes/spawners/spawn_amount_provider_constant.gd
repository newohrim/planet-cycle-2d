class_name SpawnAmountProviderConstant
extends SpawnAmountProviderBase

@export
var amount : int = 1

func get_spawn_amount(_current_amount : int) -> int:
	return amount
