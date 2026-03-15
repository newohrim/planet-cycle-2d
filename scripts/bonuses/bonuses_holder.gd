class_name BonusesHolder
extends Node

signal bonus_added(bonus : BonusBase)

var active_bonuses : Array[BonusBase]

func add_bonus(bonus : BonusBase) -> void:
	var idx = active_bonuses.find_custom(
		func(other : BonusBase): return other.is_same_bonus_type(bonus)
	)
	if idx >= 0:
		active_bonuses[idx].bonus_sum(bonus)
		bonus.queue_free()
		return
	active_bonuses.push_back(bonus)
	add_child(bonus)
	bonus.bonus_ended.connect(func(): _remove_bonus(bonus))
	bonus.bonus_begin()
	bonus_added.emit(bonus)
	
func _remove_bonus(bonus : BonusBase) -> void:
	active_bonuses.erase(bonus)
	bonus.queue_free()  # TODO: queue_free from the bonus itself instead?
