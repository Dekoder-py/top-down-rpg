extends CharacterBody2D

@export var attack_cooldown: Timer

const SPEED = 300.0

var can_attack: bool = true

func _process(_delta: float) -> void:
	if can_attack: # TODO: and key pressed attack
		print("attacked") # TODO: add actual attack
		can_attack = false
		attack_cooldown.start()
		

func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	var x_direction := Input.get_axis("left", "right")
	if x_direction:
		velocity.x = x_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var y_direction := Input.get_axis("up", "down")
	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


func _on_attack_cooldown_timeout() -> void:
	can_attack = true
