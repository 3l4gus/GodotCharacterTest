extends CharacterBody2D

#Variables
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var cont = 3

func _physics_process(delta: float) -> void:
	# Aplicar gravedad si no estamos en el suelo
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Reiniciar los saltos al tocar el suelo
	if is_on_floor():
		cont = 0

	# Permitir hasta 3 saltos
	if Input.is_action_just_pressed("ui_accept") and cont < 3:
		velocity.y = JUMP_VELOCITY
		cont += 1

#Hacemos que el personaje se pueda mover hacia la izquierda y derecha
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

#Método que se debe poner para permitir el movimiento del personaje
	move_and_slide()
