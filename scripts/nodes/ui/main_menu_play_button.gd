extends TextureButton

func _on_mouse_entered():
	self_modulate = Color(0.7, 0.7, 0.7)

func _on_mouse_exited():
	self_modulate = Color(1, 1, 1)
