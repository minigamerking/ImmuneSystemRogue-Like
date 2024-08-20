extends Area2D


func _on_body_entered(body):
	Playermanager.dmg_level()
	
	queue_free()
