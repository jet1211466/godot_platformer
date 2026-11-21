extends CanvasLayer

@onready var hearts = [$Heart1, $Heart2, $Heart3]

func update_hearts(current_health: int, from_heal: bool = false) -> void:
	for i in range(hearts.size()):
		var heart_value = (i + 1) * 2

		if current_health >= heart_value:
			hearts[i].play("full")
		elif current_health == heart_value - 1:
			hearts[i].play("half")
		else:
			hearts[i].play("empty")

		if from_heal and current_health > i * 2 and current_health <= heart_value:
			var tween = create_tween()
			tween.tween_property(hearts[i], "scale", Vector2(1.0, 1.0), 0.15)
			tween.tween_property(hearts[i], "scale", Vector2(0.75, 0.75), 0.15)
