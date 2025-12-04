extends Node2D

var screenWidth = 960

func _on_left_teleport_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.position.x += screenWidth


func _on_right_teleport_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.position.x -= screenWidth
