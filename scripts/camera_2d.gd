extends Camera2D

var strength: float = 0.0
func _process(delta: float) -> void:
	offset.x = randf_range(-strength, strength)
	offset.y = randf_range(-strength, strength)
	strength = move_toward(strength, 0.0, 20.0 * delta)
	
func start_shake(amount: float):
	strength = amount
