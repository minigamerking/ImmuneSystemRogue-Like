extends CharacterBody2D


const SPEED = 700

var direction: Vector2 = Vector2(0,1)
@export var dmg = 1
@onready var sprite_proj = $Sprite2D

func _physics_process(delta):
	if direction.x < 0:
		sprite_proj.flip_h = true
	elif direction.y > 0:
		sprite_proj.rotation_degrees = 90
	elif direction.y < 0:
		sprite_proj.rotation_degrees = 270
	
	velocity= SPEED* direction
	move_and_slide()


func _on_hitbox_body_entered(body):
	if body is Enemy:
		body.takedmg(dmg)
	queue_free()
