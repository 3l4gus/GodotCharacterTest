extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const MAX_SALTOS = 3

var saltos: int = MAX_SALTOS

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			saltos = MAX_SALTOS
		if saltos > 0:
			velocity.y = JUMP_VELOCITY
			saltos -= 1

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
