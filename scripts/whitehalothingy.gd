extends Sprite2D


func playCheckpointEffect():
	var tween = create_tween()
	
	tween.tween_property(self, "scale", Vector2(3.0, 3.0), 0.7)
	tween.parallel().tween_property(self, "modulate:a", 0.0, 0.7)
