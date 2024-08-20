extends Area2D


func _on_body_entered(body):
	if body is Player:
		Playermanager.luck_high()
		
		queue_free()
