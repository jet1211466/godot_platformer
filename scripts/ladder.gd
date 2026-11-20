extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is player:
		body.nearLadder = true


func _on_body_exited(body: Node2D) -> void:
	if body is player:
		body.nearLadder = false
