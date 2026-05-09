extends PanelContainer

@export
var anim_player : AnimationPlayer

@export
var score_label : Label

@export
var best_score_label : Label

func _ready() -> void:
	ProjectGlobals.game_over_evt.connect(_on_game_over)

func _on_game_over() -> void:
	score_label.set_text(str(ProjectGlobals.player_score.get_score()))
	best_score_label.set_text(str(ProjectGlobals.player_score.get_best_score()))
	anim_player.play("show_game_over_panel")
	
func _on_restart_button_clicked() -> void:
	get_tree().reload_current_scene()
