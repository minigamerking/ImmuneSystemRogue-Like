class_name BOSS
extends Enemy

var floor
func takedmg(dmg):
	hp-=dmg
	if hp <=0:
		match Floormanager.floor_id:
			1:
				Floormanager.floor_id+=1
				floor = preload("res://Floor scenes/Floor2/floor_2.tscn")
				get_tree().change_scene_to_packed(floor)
			2:
				Floormanager.floor_id+=1
				floor = preload("res://Floor scenes/Floor 3/floor_3.tscn")
				get_tree().change_scene_to_packed(floor)
			3:
				Floormanager.floor_id+=1
				floor = preload("res://Floor scenes/Floor4/Rooms/floor_4.tscn")
				get_tree().change_scene_to_packed(floor)
			4:
				Floormanager.floor_id+=1
				floor = preload("res://Floor scenes/Floor5/Rooms/floor_5.tscn")
				get_tree().change_scene_to_packed(floor)
		
