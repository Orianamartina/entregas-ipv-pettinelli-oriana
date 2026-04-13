extends Projectile

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_parent().has_method("take_damage"):
		body.get_parent().take_damage()
		_remove()
