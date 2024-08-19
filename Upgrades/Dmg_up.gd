extends Area2D


func _on_body_entered(body):
	Playermanager.dmglevel+=1
	
	queue_free()
