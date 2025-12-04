extends CharacterBody2D

var speed = 100.0

@onready var player: CharacterBody2D = $"../Player"
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D




func _physics_process(delta: float) -> void:
	# this is from a tutorial because i couldn't figure it out
	navigation_agent_2d.target_position = player.global_position
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


func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
