extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is player:
		body.take_damage()
		body.get_node("shakeTrackingCamera").start_shake(5.0)
