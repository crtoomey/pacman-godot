extends CharacterBody2D

var speed = 200
var isMovingRight = false
var isMovingLeft = false
var isMovingUp = false
var isMovingDown = false
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var maze_blank_map: TileMapLayer = $"../MazeBlankMap"

func _physics_process(delta: float) -> void:
	
	#var currentAgentPos = global_position
	#var nextPathPos = navigation_agent_2d.get_next_path_position()
	#var newVelocity = currentAgentPos.direction_to(nextPathPos) * speed
	#var target = 0
	#var playerX = position.x
	#var playerY = position.y
	
	
	#var collision = move_and_collide(velocity * delta)
	#if collision:
		#print(collision.get_collider())
	
	print(position)
	
	
	# movement stuff
	if Input.is_action_pressed("move_left"):
		isMovingRight = false
		isMovingLeft = true
		isMovingUp = false
		isMovingDown = false
		position.x += -1 * speed * delta 
		#target = Vector2(playerX - 32, playerY)
		#navigation_agent_2d.target_position = target
	elif Input.is_action_pressed("move_right"):
		isMovingRight = true
		isMovingLeft = false
		isMovingUp = false
		isMovingDown = false
		position.x += 1 * speed * delta 
		#target = Vector2(playerX + 32, playerY)
		#navigation_agent_2d.target_position = target
	elif Input.is_action_pressed("move_up"):
		isMovingRight = false
		isMovingLeft = false
		isMovingUp = true
		isMovingDown = false
		position.y += -1 * speed * delta 
		#target = Vector2(playerX, playerY -32)
		#navigation_agent_2d.target_position = target
	elif Input.is_action_pressed("move_down"):
		isMovingRight = false
		isMovingLeft = false
		isMovingUp = false
		isMovingDown = true
		position.y += 1 * speed * delta 
		#target = Vector2(playerX, playerY + 32)
		#navigation_agent_2d.target_position = target
	else:
		isMovingRight = false
		isMovingLeft = false
		isMovingUp = false
		isMovingDown = false

	#movement stuff for navigation agent
	#if navigation_agent_2d.is_navigation_finished():
		#return
	#
	#if navigation_agent_2d.avoidance_enabled:
		#navigation_agent_2d.set_velocity(newVelocity)
	#else:
		#_on_navigation_agent_2d_velocity_computed(newVelocity)
	
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
	


#func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	#velocity = safe_velocity
