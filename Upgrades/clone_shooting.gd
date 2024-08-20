extends Area2D


func _on_body_entered(body):
	if body is Player:
		Playermanager.shoot_clone()
		
		queue_free()
