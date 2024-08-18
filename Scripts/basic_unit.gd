extends CharacterBody2D
class_name Enemy

@export var detection_radius := 200.0
@export var move_speed := 50.0
@onready var navigation_agent = $NavigationAgent2D

@export var hp = 5
signal update_enemy_count


func takedmg(dmg):
	hp-=dmg
	if hp <=0:
		update_enemy_count.emit()
		queue_free()

var current_state = "idle"

@onready var regular_pos = global_position

var player : Player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_state == "idle":
		if int(navigation_agent.distance_to_target()) > 10:
			navigation_agent.set_target_position(regular_pos)
	if current_state == "chase":
		navigation_agent.set_target_position(player.global_position)

func _physics_process(delta):
	if int(global_position.distance_to(player.global_position)) > 350:
			current_state = "idle"
	if int(global_position.distance_to(player.global_position)) < 200:
		current_state = "chase"
	
	
	if navigation_agent.is_target_reachable():
		if int(navigation_agent.distance_to_target()) > 80:
			var next_location = navigation_agent.get_next_path_position()
			var direction = global_position.direction_to(next_location).normalized()
			global_position += direction * delta * move_speed
	else:
		current_state = "idle"
