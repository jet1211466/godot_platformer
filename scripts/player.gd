extends CharacterBody2D
class_name player
var spawn_point = Vector2(112, 528)
var health = 6

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite = $animation
@onready var jump_SFX = $jump
@onready var died_SFX = $died
@onready var health_ui = $playerHealth 
@onready var hurt_SFX = $hurt

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
# animation
	if not is_on_floor():
		animated_sprite.play("jump")
	elif velocity.x != 0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
			
	# direction
	if velocity.x != 0:
		animated_sprite.flip_h = (velocity.x < 0)

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_SFX.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
# respawn if player fell
	if position.y > 1300:
		respawn()
		died_SFX.play()

	move_and_slide()
	
func respawn():
	position = spawn_point
	velocity = Vector2.ZERO
	health = 6
	health_ui.update_hearts(health)
	died_SFX.play()
	
func take_damage():
	if health > 1:
		health -= 1
		health_ui.update_hearts(health)
		hurt_SFX.play()
	else:
		respawn()
