extends CharacterBody2D

var speed = 200
var isMovingRight = false
var isMovingLeft = false
var isMovingUp = false
var isMovingDown = false

func _physics_process(delta: float) -> void:
	# movement stuff
	if Input.is_action_pressed("move_left"):
		isMovingRight = false
		isMovingLeft = true
		isMovingUp = false
		isMovingDown = false
		position.x += -1 * speed * delta 
	elif Input.is_action_pressed("move_right"):
		isMovingRight = true
		isMovingLeft = false
		isMovingUp = false
		isMovingDown = false
		position.x += 1 * speed * delta 
	elif Input.is_action_pressed("move_up"):
		isMovingRight = false
		isMovingLeft = false
		isMovingUp = true
		isMovingDown = false
		position.y += -1 * speed * delta 
	elif Input.is_action_pressed("move_down"):
		isMovingRight = false
		isMovingLeft = false
		isMovingUp = false
		isMovingDown = true
		position.y += 1 * speed * delta 
	else:
		isMovingRight = false
		isMovingLeft = false
		isMovingUp = false
		isMovingDown = false

	
	# check movement direction and rotate sprite based on that
	if isMovingRight == true:
		rotation_degrees = 0
	elif isMovingLeft == true:
		rotation_degrees = 180
	elif isMovingUp == true:
		rotation_degrees = -90
	elif isMovingDown == true:
		rotation_degrees = 90
	move_and_slide()
