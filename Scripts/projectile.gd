extends CharacterBody2D


const SPEED = 900

var direction: Vector2 = Vector2(0,1)
@export var dmg = 1
func _physics_process(delta):
	
	
	velocity= SPEED* direction
	move_and_slide()


func _on_hitbox_body_entered(body):
	if body is Enemy:
		body.takedmg(dmg)
	queue_free()
