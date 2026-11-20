extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is player and body.health != 6:
		body.heal()
		queue_free()
		
		
func _ready() -> void:
	var tween = create_tween().set_loops()
	
	tween.tween_property(self, "position:y", position.y + 3.0, 0.5)
	tween.tween_property(self, "position:y", position.y - 3.0, 0.5)
 
