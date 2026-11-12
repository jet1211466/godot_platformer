extends CanvasLayer

@onready var hearts = [$Heart1, $Heart2, $Heart3]

func update_hearts(current_health: int):
	for i in range(hearts.size()):
		var heart_value = (i + 1) * 2
		if current_health >= heart_value:
			hearts[i].play("full")
		elif current_health == heart_value - 1:
			hearts[i].play("half")
		else:
			hearts[i].play("empty")
