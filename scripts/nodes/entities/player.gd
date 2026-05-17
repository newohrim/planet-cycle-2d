class_name Player
extends Node2D

var gravity_area: GravityArea2D:
	get:
		return %GravityArea2D

@onready
var _bonuses_holder : BonusesHolder = %BonusesHolder

func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("Consume"):
		# TODO: make iterator?
		for body in gravity_area.orbited_bodies:
			# TODO: any better solution than actual type checking?
			if (not body) or (not body is MoonBase):
				continue
			var moon = body as MoonBase
			if moon.is_powered():
				var bonus = moon.extract_bonus()
				_bonuses_holder.add_bonus(bonus)  # activates bonus
			body.queue_free()
