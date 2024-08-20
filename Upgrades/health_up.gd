extends Area2D


func _on_body_entered(body):
		body.find_child("PlayerManager").health_up()
		queue_free()
