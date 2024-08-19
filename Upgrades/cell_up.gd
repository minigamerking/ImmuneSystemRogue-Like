extends Area2D


func _on_body_entered(body):
	Playermanager.max_cell_count +=2
	print(Playermanager.max_cell_count)
	queue_free()
