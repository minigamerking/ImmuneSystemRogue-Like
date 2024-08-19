extends CharacterBody2D

const SPEED = 900

var direction: Vector2 = Vector2(0,1)
@export var dmg = 1
@onready var proj_sprite = $Sprite2D

func _physics_process(delta):
	if direction.x > 0:
		proj_sprite.rotation = tan(direction.y)
	else:
		proj_sprite.rotation = tan(-direction.y)
	velocity= SPEED* direction
	
	move_and_slide()
	


func _on_hitbox_body_entered(body):
	#if body is Player:
	#	body.takedmg(dmg)
	queue_free()
