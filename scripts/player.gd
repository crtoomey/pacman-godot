extends CharacterBody2D

var speed = 200

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("move_left"):
		position.x += -1 * speed * delta 
	if Input.is_action_pressed("move_right"):
		position.x += 1 * speed * delta 
	if Input.is_action_pressed("move_up"):
		position.y += -1 * speed * delta 
	if Input.is_action_pressed("move_down"):
		position.y += 1 * speed * delta 
	move_and_slide()
