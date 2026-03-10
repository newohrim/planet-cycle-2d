class_name Moon
extends Node2D

@onready
var powerComp : PowerComponent = %PowerComponent

@onready
var bonus_provider : BonusProvider = %BonusProvider

func is_powered() -> bool:
	return powerComp.is_powered()

func extract_bonus() -> BonusBase:
	return bonus_provider.extract_bonus()
