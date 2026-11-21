extends Area2D
@export var checkpointPosition: Vector2
var alreadyActivated = false



func _on_body_entered(body: Node2D) -> void:
	if body is player and alreadyActivated == false and checkpointPosition != Vector2(40, 552):
		$newCheckpointSFX.play()
		$whitehalothingy.visible = true
		$whitehalothingy.playCheckpointEffect()
		alreadyActivated = true
		body.respawnPosition = checkpointPosition
