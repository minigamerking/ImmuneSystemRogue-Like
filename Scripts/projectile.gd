extends CharacterBody2D


const SPEED = 900

var direction: Vector2 = Vector2(0,1)
@export var dmg = 100
@onready var proj_sprite = $Sprite2D

func _physics_process(delta):
	if direction.x > 0:
		proj_sprite.rotation = tan(direction.y)
	else:
		proj_sprite.rotation = tan(-direction.y)
	velocity= SPEED* direction
	
	move_and_slide()
	
func _ready():
	match get_tree().get_first_node_in_group("Player").find_child("PlayerManager").dmglevel:
		0:
			dmg =1
		1:
			dmg =2
		2:
			dmg = 4
		3:
			dmg = 4
		4:
			dmg = 8
		_:
			dmg = 8

func _on_hitbox_body_entered(body):
	if body is Enemy:
		body.takedmg(dmg)
	queue_free()
