extends Node
class_name PlayerManager

var curr_cell_count = 1
var max_cell_count = 5

var player : Player
var playerclone = preload("res://Scenes/player_clone.tscn")
var fire_speed= 0.5
var health = 3
var max_health = 3
var clones = []
var dmglevel = 0
var luck = 0.25
var enemy_in_range = false
var can_be_hurt = true

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
	max_cell_count = 5 + clone_upgrade * 2
	max_health = 3 + health_upgrade
	luck = 0.25 - luck_upgrade * 0.01
	fire_speed = 0.5 - fire_upgrade * 0.05
	if luck < 0: luck = 0
	if can_be_hurt and enemy_in_range: takedmg()
	if health == 0 and curr_cell_count > 1:
		_clone_die(clones.pick_random())
		health = max_health
	elif health == 0 and curr_cell_count <= 1:
		get_tree().reload_current_scene()
		reset_upgrades()
		
func reset_upgrades():
	clone_upgrade = 0
	clone_shoot_upgrade = 0
	luck_upgrade = 0
	health_upgrade = 0
	fire_upgrade = 0
	dmglevel = 0

func up_firespd():
	fire_speed /= 2

func up_maxcell():
	clone_upgrade += 1
	
func dmg_level():
	dmglevel += 1

func health_up():
	health_upgrade += 1
	health += 1

func luck_high():
	luck_upgrade += 1

func shoot_clone():
	clone_shoot_upgrade = 1

func connect_enemies():
	for child in get_tree().get_nodes_in_group("Enemy"):
		child.update_enemy_count.connect(_enemy_on_death)
	


func _enemy_on_death():
	if randf() > luck and (curr_cell_count < max_cell_count):
		curr_cell_count += 1
		var clone = playerclone.instantiate()
		clones.append(clone)
		if clone_shoot_upgrade:
			clone.shoot_upgrade = true
		clone.global_position = player.global_position
		clone.find_child("Sprite2D").texture = player.sprite_2d.texture
		clone.die.connect(_clone_die.bind(clone))
		get_parent().get_parent().add_child(clone)

func _clone_die(clone):
	clones.erase(clone)
	clone.queue_free()
	curr_cell_count -= 1
	
func takedmg():
	can_be_hurt = false
	player.find_child("HurtTimer").start()
	health -= 1


func _on_enemy_collider_body_entered(body):
	if body is Enemy:
		enemy_in_range = true


func _on_enemy_collider_body_exited(body):
	if body is Enemy:
		enemy_in_range = false


func _on_hurt_timer_timeout():
	can_be_hurt = true
