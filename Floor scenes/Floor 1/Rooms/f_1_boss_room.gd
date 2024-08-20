
extends BasicRoom
@onready var enemies = $enemies

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
	enemycount = enemies.size()
	for enemy in enemies:
		enemy.connect("update_enemy_count",_on_test__enemy_update_enemy_count)
	var boss
	match Floormanager.floor_id:
		1:
			
			boss = preload("res://enemies/floor_1_boss.tscn")
			var newboss = boss.instantiate()
			$enemies.add_child(newboss)
			newboss.global_position =$"boss spawn".global_position
			
		2:
		
			boss = preload("res://enemies/floor_1_boss.tscn")
			var newboss = boss.instantiate()
			$enemies.add_child(newboss)
			newboss.global_position =$"boss spawn".global_position
		#3:
			#Floormanager.floor_id+=1
			#floor = preload("res://Floor scenes/Floor4/Rooms/floor_4.tscn")
			#get_tree().change_scene_to_packed(floor)
		#4:
			#Floormanager.floor_id+=1
			#floor = preload("res://Floor scenes/Floor5/Rooms/floor_5.tscn")
			#get_tree().change_scene_to_packed(floor)
		#
			
