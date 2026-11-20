extends Area2D
@onready var coinSFX = $coinSFX
var alreadyCollected = false


func collected():
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is player and alreadyCollected == false:
		alreadyCollected = true
		hide()
		coinSFX.play()
		await coinSFX.finished
		collected()
		
func _ready() -> void:
	var tween = create_tween().set_loops()
	
	tween.tween_property(self, "position:y", position.y + 3.0, 0.5)
	tween.tween_property(self, "position:y", position.y - 3.0, 0.5)
