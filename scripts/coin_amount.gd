extends CanvasLayer
var coinsCollected = 0

@onready var digit_sprites: Array[AnimatedSprite2D] = [
	$numbers1,
	$numbers2
]

func update_coins() -> void:
	var digits := str(coinsCollected).pad_zeros(2)

	for i in range(2):
		var sprite := digit_sprites[i]
		sprite.animation = digits[i] # Animations must be named "0" through "9"
		sprite.frame = 0
		sprite.stop()
 
