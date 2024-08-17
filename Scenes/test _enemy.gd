extends Area2D

signal update_enemy_count

func _on_body_entered(body):
	update_enemy_count.emit()
	queue_free()
	
	
	
