extends Node
class_name PlayerManager

var curr_cell_count = 1
var max_cell_count = 5

var player : Player
var playerclone = preload("res://Scenes/player_clone.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func connect_enemies():
	await get_tree().create_timer(0.1).timeout
	for child in get_tree().get_nodes_in_group("Enemy"):
		child.update_enemy_count.connect(_enemy_on_death)


func _enemy_on_death():
	if randf() > 0.25 and (curr_cell_count < max_cell_count):
		curr_cell_count += 1
		var clone = playerclone.instantiate()
		clone.global_position = player.global_position
		clone.find_child("Sprite2D").texture = player.sprite_2d.texture
		clone.die.connect(_clone_die)
		get_parent().get_parent().add_child(clone)

func _clone_die():
	curr_cell_count -= 1
