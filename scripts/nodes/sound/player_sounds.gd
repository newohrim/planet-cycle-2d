extends Node

@export
var damage_hit_sound : AudioStreamPlayer

@export
var score_hit_sound : AudioStreamPlayer

func _ready() -> void:
	ProjectGlobals.player_score.score_changed.connect(_on_score_changed)

func _on_health_changed(_health: float, delta: float) -> void:
	if delta < 0:
		damage_hit_sound.play()
		
func _on_score_changed(_score: int) -> void:
	score_hit_sound.play()
