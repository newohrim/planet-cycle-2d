class_name MoonBase
extends Node2D

@onready
var powerComp : PowerComponent = %PowerComponent

@onready
var bonus_provider : BonusProvider = %BonusProvider

func extract_bonus() -> BonusBase:
	return bonus_provider.extract_bonus()
	
func is_powered() -> bool:
	return powerComp.is_powered()
