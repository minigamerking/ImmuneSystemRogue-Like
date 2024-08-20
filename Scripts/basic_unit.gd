extends CharacterBody2D
class_name Enemy

@export var detection_radius := 1000.0
@export var move_speed := 200
@onready var navigation_agent = $NavigationAgent2D
@onready var sprite_2d = $Sprite2D
@onready var death = $death as AudioStreamPlayer2D

@export var hp = 5
var enabled = false
signal update_enemy_count
var stopdistance = 100

func takedmg(dmg):
	if enabled:
		hp-=dmg
		if hp <=0:
			update_enemy_count.emit()
			death.play()
			enabled= false
			await  death.finished
			queue_free()

var current_state = "idle"

@onready var regular_pos = global_position

var player : Player

#Called when the node enters the scene tree for the first time.
func _ready():
	match Floormanager.floor_id:
		2:
			sprite_2d.texture =preload("res://sprites/red_BC.png")
		3:
			sprite_2d.texture =preload("res://sprites/white_BC.png")
		4:
			sprite_2d.texture= preload("res://sprites/Killer_T.png")
		5:
			var texture_chance = randi_range(2,4)
			match texture_chance:
				2:
					sprite_2d.texture =preload("res://sprites/red_BC.png")
				3:
						sprite_2d.texture =preload("res://sprites/white_BC.png")
				4:
					sprite_2d.texture= preload("res://sprites/Killer_T.png")
	player = get_tree().get_first_node_in_group("Player")


#Called every frame. 'delta' is the elapsed time since the previous frame.
func set_target():
	if current_state == "idle":
		if int(navigation_agent.distance_to_target()) > 10:
			navigation_agent.set_target_position(regular_pos)
	if current_state == "chase":
		navigation_agent.set_target_position(player.global_position)


func _process(delta):
	set_target()
func path_find(delta):
	if int(global_position.distance_to(player.global_position)) > 550:
		current_state = "idle"
	if int(global_position.distance_to(player.global_position)) < 350:
		current_state = "chase"


	if navigation_agent.is_target_reachable() and enabled:
		if int(navigation_agent.distance_to_target()) > stopdistance:
			var next_location = navigation_agent.get_next_path_position()
			var direction = global_position.direction_to(next_location).normalized()
			global_position += direction * delta * move_speed
	else:
		current_state = "idle"
func _physics_process(delta):
	path_find(delta)
