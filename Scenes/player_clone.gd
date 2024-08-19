extends CharacterBody2D
class_name PlayerClone

signal die
var speed : float
var player : Player
const PROJECTILE = preload("res://Scenes/projectile.tscn")
var can_shoot = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _enter_tree():
	player = get_tree().get_first_node_in_group("Player")
	speed = player.SPEED - 50.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("leftclick") and can_shoot:
			var newprojectile = PROJECTILE.instantiate()
			newprojectile.global_position = global_position
			newprojectile.direction = -(position - get_global_mouse_position()).normalized()
			get_parent().add_child(newprojectile)
			can_shoot = false
			$projectilecd.start()
	if player:
		
		if global_position.distance_to(player.global_position) > 600:
			die.emit()
			queue_free()

func _physics_process(delta):
	if global_position.distance_to(player.global_position) > 50:
		var direction = (player.position - position).normalized()
		velocity = direction * speed
	else:
		velocity = Vector2()
	
	move_and_slide()


func _on_projectilecd_timeout():
	can_shoot = true
