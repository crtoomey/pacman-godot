extends CharacterBody2D


var speed = 100.0
var scattering = false

@onready var maze_blank_map: TileMapLayer = $"../MazeBlankMap"
@onready var player: CharacterBody2D = $"../Player"
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D

func _ready() -> void:
	scattering = true


func _physics_process(delta: float) -> void:
	print(scattering)
	# this is from a tutorial because i couldn't figure it out
	if scattering == true:
		scatter()
	else:
		navigation_agent_2d.target_position = player.global_position
		
	var currentAgentPos = global_position
	var nextPathPos = navigation_agent_2d.get_next_path_position()
	var newVelocity = currentAgentPos.direction_to(nextPathPos) * speed
	var distanceToPlayer = navigation_agent_2d.distance_to_target()
	print(distanceToPlayer)
	if distanceToPlayer < 256:
		scattering = true
		
	if navigation_agent_2d.is_navigation_finished():
		return
	
	if navigation_agent_2d.avoidance_enabled:
		navigation_agent_2d.set_velocity(newVelocity)
	else:
		_on_navigation_agent_2d_velocity_computed(newVelocity)
	

	move_and_slide()

func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity

func scatter():
	var scatterStartPos = Vector2(895, 480)
	navigation_agent_2d.target_position = scatterStartPos
	await get_tree().create_timer(8).timeout
	scattering = false
