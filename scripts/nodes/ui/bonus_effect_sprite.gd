extends AnimatedSprite2D

@export
var bonusesHolder : BonusesHolder

@export
var timer : Timer

var tween : Tween

func _ready() -> void:
	ProjectGlobals.player_state.state_changed.connect(_on_state_changed)
	timer.timeout.connect(_on_bonus_end_warning_timeout)
	bonusesHolder.bonus_added.connect(_on_bonus_added)
	
func _on_state_changed(state : PlayerState.PLAYER_STATE_E, value : bool) -> void:
	if state == PlayerState.PLAYER_STATE_E.IS_INVULNERABLE:
		timer.stop()
		_stop_warning()
		set_visible(value)
		
func _on_bonus_added(bonus : BonusBase) -> void:
	var bonusGeneric = bonus as BonusGeneric
	if bonusGeneric and bonusGeneric.target_state.find(PlayerState.PLAYER_STATE_E.IS_INVULNERABLE) >= 0:
		var warnTime = bonusGeneric.timer.get_wait_time() * 0.75
		if is_zero_approx(warnTime):
			return
		timer.start(warnTime)
		
func _on_bonus_end_warning_timeout():
	_stop_warning()
	tween = create_tween()
	tween.set_loops()
	tween.tween_property(self, "visible", false, 0.0)
	tween.tween_interval(0.2)
	tween.tween_property(self, "visible", true, 0.0)
	tween.tween_interval(0.2)

func _stop_warning():
	if tween:
		tween.kill()
