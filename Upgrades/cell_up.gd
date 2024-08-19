extends Area2D


func _on_body_entered(body):
	Playermanager.up_maxcell()
	queue_free()
