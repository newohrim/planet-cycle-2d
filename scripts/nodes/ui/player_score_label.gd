extends Label

func _ready() -> void:
	ProjectGlobals.player_score.score_changed.connect(_on_score_changed)
	
func _on_score_changed(score: int):
	set_text(str(score))
