extends Sprite2D

func _ready():
	modulate.a = 0.0

	var tween = create_tween()

	# Fade in
	tween.tween_property(self, "modulate:a", 1.0, 0.08)

	# Fade out
	tween.tween_property(self, "modulate:a", 0.0, 0.45)

	# Move downward while fading out
	tween.parallel().tween_property(self, "position:y", position.y + 20.0, 0.45)

	# Remove the cloud
	tween.tween_callback(queue_free)
