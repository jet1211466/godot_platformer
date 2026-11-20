extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is player and body.health != 6:
		body.heal()
		queue_free()
