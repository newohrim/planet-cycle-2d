class_name BonusProvider
extends Node

@export
var bonusScene : PackedScene

func extract_bonus() -> BonusBase:
	if not bonusScene:
		return null
	return bonusScene.instantiate()
