extends Area2D
@onready var sound_player = $hurt

func _on_body_entered(body: Node2D) -> void:
	if body is player:
		body.respawn()
		sound_player.play()
