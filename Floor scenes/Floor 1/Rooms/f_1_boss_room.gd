
extends BasicRoom

func _ready():
	
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
			boss =load("res://enemies/floor_1_boss.tscn")
			var newboss = boss.instantiate()
			$enemies.add_child(newboss)
			newboss.global_position=$"boss spawn".global_position
		2:
			boss= load("res://enemies/f_2_boss.tscn")
			var newboss = boss.instantiate()
			$enemies.add_child(newboss)
			newboss.global_position=$"boss spawn".global_position
			
		3:
			boss= load("res://enemies/f_3_boss.tscn")
			var newboss = boss.instantiate()
			$enemies.add_child(newboss)
			newboss.global_position=$"boss spawn".global_position
			
		4:
			boss= load("res://enemies/f_4_boss.tscn")
			var newboss = boss.instantiate()
			$enemies.add_child(newboss)
			newboss.global_position=$"boss spawn".global_position
			


var floor



func _on_exit_body_entered(body):
	if Floormanager.bossdefeated== true:
		Floormanager.floorgenerated = false
		Floormanager.bossdefeated = false
		var dungeon = get_parent().get_parent()
		match Floormanager.floor_id:
			1:
				Floormanager.floor_id+=1
				floor = preload("res://Floor scenes/Floor2/floor_2.tscn")
				dungeon.find_child("floor_template").queue_free()
				dungeon.add_child(floor.instantiate())
				dungeon.get_parent().find_child("player").global_position = Vector2(587,306)
			2:
				Floormanager.floor_id+=1
				floor = preload("res://Floor scenes/Floor 3/floor_3.tscn")
				dungeon.find_child("Floor_2").queue_free()
				dungeon.add_child(floor.instantiate())
				dungeon.get_parent().find_child("player").global_position = Vector2(587,306)
			3:
				Floormanager.floor_id+=1
				floor = preload("res://Floor scenes/Floor4/Rooms/floor_4.tscn")
				dungeon.find_child("floor_3").queue_free()
				dungeon.add_child(floor.instantiate())
				dungeon.get_parent().find_child("player").global_position = Vector2(587,306)
			4:
				Floormanager.floor_id+=1
				floor = preload("res://Floor scenes/Floor5/Rooms/floor_5.tscn")
				dungeon.find_child("floor_4").queue_free()
				dungeon.add_child(floor.instantiate())
				dungeon.get_parent().find_child("player").global_position = Vector2(587,306)
