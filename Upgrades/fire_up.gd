extends Area2D


func _on_body_entered(body):
	Playermanager.up_firespd()
	queue_free()
