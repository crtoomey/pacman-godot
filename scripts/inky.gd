extends CharacterBody2D

var speed = 100.0

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var player: CharacterBody2D = $"../Player"
@onready var blinky: CharacterBody2D = $"../Blinky"

func _physics_process(delta: float) -> void:
	
	
	# this is from a tutorial because i couldn't figure it out
	checkPlayerRotation()
	var currentAgentPos = global_position
	var nextPathPos = navigation_agent_2d.get_next_path_position()
	var newVelocity = currentAgentPos.direction_to(nextPathPos) * speed
	
	if navigation_agent_2d.is_navigation_finished():
		return
	
	if navigation_agent_2d.avoidance_enabled:
		navigation_agent_2d.set_velocity(newVelocity)
	else:
		_on_navigation_agent_2d_velocity_computed(newVelocity)
	
	move_and_slide()


func checkPlayerRotation():
	var blinkyPos = blinky.global_position
	var distance = Vector2.ZERO
	var playerRotation = player.rotation_degrees
	var target = Vector2.ZERO
	if playerRotation == 0:
		#print("pinky going right")
		target = player.global_position + Vector2(64, 0)
		distance = target - blinkyPos
		navigation_agent_2d.target_position = blinkyPos + distance * 2
		
	# this doesn't work? idk why. just made the else statement handle left direction
	#elif playerRotation == -180:
		##print("pinky going left")
		#target = player.global_position + Vector2(-128, 0)
		#navigation_agent_2d.target_position = target
	elif playerRotation == -90:
		#print("pinky going up")
		target = player.global_position + Vector2(0, -64)
		distance = target - blinkyPos
		navigation_agent_2d.target_position = blinkyPos + distance * 2
	elif playerRotation == 90:
		#print("pinky going down")
		target = player.global_position + Vector2(0, 64)
		distance = target - blinkyPos
		navigation_agent_2d.target_position = blinkyPos + distance * 2
	else:
		#print("pinky going left")
		target = player.global_position + Vector2(-64, 0)
		distance = target - blinkyPos
		navigation_agent_2d.target_position = blinkyPos + distance * 2


func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
