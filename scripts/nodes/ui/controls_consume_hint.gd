extends HBoxContainer

func _ready() -> void:
	set_visible(false)
	var player = get_tree().get_first_node_in_group("player") as Player
	player.gravity_area.body_added.connect(_on_body_added)
	player.gravity_area.body_removed.connect(_on_body_removed)
	
func _on_body_added(body: Node2D) -> void:
	if body is MoonBase:
		(body as MoonBase).powerComp.powered_up_max.connect(_on_moon_powered_up)
	
func _on_body_removed(_body: Node2D) -> void:
	set_visible(false)
	
func _on_moon_powered_up() -> void:
	set_visible(true)
