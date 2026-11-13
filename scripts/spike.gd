extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is player:
		body.take_damage()
		body.get_node("Camera2D").start_shake(3.0)
