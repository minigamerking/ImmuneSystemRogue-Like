extends Node
class_name PlayerManager

var curr_cell_count = 1
var max_cell_count = 5

var player : Player
var playerclone = preload("res://Scenes/player_clone.tscn")
var fire_speed= 0.5
var dmglevel = 0

# Upgrades Had
var fire_upgrade = 0
var clone_upgrade = 0
var health_upgrade = 0
var clone_shoot_upgrade = 0
var luck_upgrade = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func up_firespd():
	fire_speed= fire_speed/2
func up_maxcell():
	max_cell_count =7
	print("MAX CEELS"+ str(max_cell_count))


func connect_enemies():
	await get_tree().create_timer(0.1).timeout
	for child in get_tree().get_nodes_in_group("Enemy"):
		child.update_enemy_count.connect(_enemy_on_death)


func _enemy_on_death():
	print("c_cell"+str(curr_cell_count))
	print("m_cell"+str(max_cell_count))
	if curr_cell_count<max_cell_count:#randf() > 0.25 and (curr_cell_count < max_cell_count):
		curr_cell_count += 1
		var clone = playerclone.instantiate()
		clone.global_position = player.global_position
		clone.find_child("Sprite2D").texture = player.sprite_2d.texture
		clone.die.connect(_clone_die)
		get_parent().get_parent().add_child(clone)

func _clone_die():
	curr_cell_count -= 1
	print("died")
