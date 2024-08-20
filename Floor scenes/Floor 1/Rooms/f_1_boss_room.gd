
extends BasicRoom

var dungeon

func _ready():
	dungeon = get_tree().get_first_node_in_group("DungeonHandler")
	if r_dooravailble==false:
		num_of_availble_doors-=1
	if u_dooravailble== false:
		num_of_availble_doors-=1
	if d_dooravailble==false:
		num_of_availble_doors -=1
	if l_dooravailble==false:
		num_of_availble_doors-=1
	var enemies = $enemies.get_children()
	for enemy in enemies:
		enemy.connect("update_enemy_count",_on_test__enemy_update_enemy_count)
	var boss
	match Floormanager.floor_id:
		1:
			boss =preload("res://enemies/floor_1_boss.tscn")
			var newboss = boss.instantiate()
			$enemies.add_child(newboss)
			newboss.global_position=$"boss spawn".global_position
		2:
			boss= preload("res://enemies/f_2_boss.tscn")
			var newboss = boss.instantiate()
			$enemies.add_child(newboss)
			newboss.global_position=$"boss spawn".global_position


var floor



func _on_exit_body_entered(body):
	if Floormanager.bossdefeated== true:
		Floormanager.floorgenerated = false
		Floormanager.bossdefeated = false
		match Floormanager.floor_id:
			1:
				Floormanager.floor_id+=1
				floor = preload("res://Floor scenes/Floor2/floor_2.tscn")
				get_tree().get_first_node_in_group("Floor").queue_free()
				dungeon.add_child(floor.instantiate())
				get_tree().get_first_node_in_group("Player").global_position = Vector2(587,306)
			2:
				Floormanager.floor_id+=1
				floor = preload("res://Floor scenes/Floor 3/floor_3.tscn")
				print(get_tree().get_first_node_in_group("Floor"))
				get_tree().get_first_node_in_group("Floor").queue_free()
				dungeon.add_child(floor.instantiate())
				get_tree().get_first_node_in_group("Player").global_position = Vector2(587,306)
			3:
				Floormanager.floor_id+=1
				floor = preload("res://Floor scenes/Floor4/Rooms/floor_4.tscn")
				get_tree().get_first_node_in_group("Floor").queue_free()
				dungeon.add_child(floor.instantiate())
				get_tree().get_first_node_in_group("Player").global_position = Vector2(587,306)
			4:
				Floormanager.floor_id+=1
				floor = preload("res://Floor scenes/Floor5/Rooms/floor_5.tscn")
				get_tree().get_first_node_in_group("Floor").queue_free()
				dungeon.add_child(floor.instantiate())
				get_tree().get_first_node_in_group("Player").global_position = Vector2(587,306)
