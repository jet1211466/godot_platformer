extends Sprite2D

func start_effect():
	modulate.a = 0.0

	var tween = create_tween()

	# Fade in
	tween.tween_property(self, "modulate:a", 1.0, 0.08)

	# Fade out
	tween.tween_property(self, "modulate:a", 0.0, 0.45)

	# Move downward while fading out
	var start_y = global_position.y
	tween.parallel().tween_property(self, "position:y", start_y + 20.0, 0.2)

	# Remove the cloud
	tween.tween_callback(queue_free)
