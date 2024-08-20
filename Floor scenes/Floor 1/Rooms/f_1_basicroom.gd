
extends Node2D
class_name BasicRoom

@onready var l_door = $l_Door
@onready var r_door = $r_Door
@onready var d_door = $d_Door
@onready var u_door = $u_Door
@onready var overlapping_room_dectetor = $overlapping_room_dectetor

var is_hall = false
var is_cross = false




var room

@export var num_of_availble_doors = 4

@export var r_dooravailble=true

@export var u_dooravailble=true
@export var d_dooravailble=true

@export var l_dooravailble=true
# Called when the node enters the scene tree for the first time

@onready var u_room = $u_room
@onready var d_room = $d_room
@onready var l_room = $l_room
@onready var r_room = $r_room

func addroom(max_rooms , num_of_rooms):
	var fail_count =0
	if max_rooms >num_of_rooms:
		var rooms_to_add= randi_range(1,num_of_availble_doors)
		while num_of_rooms+rooms_to_add>max_rooms:
			rooms_to_add -=1
		var added_rooms =0
		var newroom
		while added_rooms<rooms_to_add:
			if fail_count >=10:
				break
			var roomrange = 4
			var doorrange = 4
		
			if is_cross == true:
				doorrange= 3
				roomrange =3
#U = 1 d = 2 l =3 r =5
			var door_id = randi_range(1,doorrange)
		
			var room_id = randi_range(1,roomrange)
			
			if num_of_rooms >= max_rooms-1:
				room_id = 10
			if rooms_to_add >1 and added_rooms ==0:
				var treasure_chance = randi_range(1,2)
				if treasure_chance ==2 and Floormanager.floor_id !=5:
					room_id = 11
			match  Floormanager.floor_id:
				1:
					match room_id:
						1:
							room =preload("res://Floor scenes/Floor 1/Rooms/f_1_basicroom.tscn")
						2:
							room = preload("res://Floor scenes/Floor 1/Rooms/f_1_corner_rooms.tscn")
						3:
							room = preload("res://Floor scenes/Floor 1/Rooms/f_1_crosssectionroom.tscn")
						4:
							room =preload("res://Floor scenes/Floor 1/Rooms/f_1_hallroom.tscn")
						10:
							room = preload("res://Floor scenes/Floor 1/Rooms/f_1_boss_room.tscn")
						11:
							room=preload("res://Floor scenes/Floor 1/Rooms/f_1_treasure_room.tscn")
				2:
					match room_id:
						1:
							room =preload("res://Floor scenes/Floor2/Rooms/f_2_wallroom.tscn")
						2:
							room = preload("res://Floor scenes/Floor2/Rooms/f_2_crossroom.tscn")
						3:
							room = preload("res://Floor scenes/Floor2/Rooms/f_2_holessectionroom.tscn")
						4:
							room =preload("res://Floor scenes/Floor2/Rooms/f_2_zigroom.tscn")
						10:
							room = preload("res://Floor scenes/Floor 1/Rooms/f_1_boss_room.tscn")
						11:
							room=preload("res://Floor scenes/Floor 1/Rooms/f_1_treasure_room.tscn")
				3:
					
					match room_id:
						1:
							room =preload("res://Floor scenes/Floor 3/f_3_cystroom.tscn")
						2:
							room = preload("res://Floor scenes/Floor 3/f_3_wallroom.tscn")
						3:
							room = preload("res://Floor scenes/Floor 3/f_3_pathroom.tscn")
						4:
							room =preload("res://Floor scenes/Floor 3/f_3_scaredroom.tscn")
						10:
							room =preload("res://Floor scenes/Floor 1/Rooms/f_1_boss_room.tscn")
						11:
							room=preload("res://Floor scenes/Floor 1/Rooms/f_1_treasure_room.tscn")
				4:
					match room_id:
						1:
							room =preload("res://Floor scenes/Floor4/Rooms/f_4_plusroom.tscn")
						2:
							room = preload("res://Floor scenes/Floor4/Rooms/f_4_diamondroom.tscn")
						3:
							room = preload("res://Floor scenes/Floor4/Rooms/f_4_lroom.tscn")
						4:
							room =preload("res://Floor scenes/Floor4/Rooms/f_4_rev_lroom.tscn")
						10:
							room =preload("res://Floor scenes/Floor 1/Rooms/f_1_boss_room.tscn")
						11:
							room=preload("res://Floor scenes/Floor 1/Rooms/f_1_treasure_room.tscn")
				5:
					match room_id:
						1:
							room =preload("res://Floor scenes/Floor5/Rooms/f_5_diarooms.tscn")
						2:
							room = preload("res://Floor scenes/Floor5/Rooms/f_5_holerooms.tscn")
						3:
							room =preload("res://Floor scenes/Floor5/Rooms/f_5_hor_rooms.tscn")
						4:
							room = preload("res://Floor scenes/Floor5/Rooms/f_5_vert_rooms.tscn")
						10:
							room = preload("res://Floor scenes/Floor5/Rooms/f_5_bossroom.tscn")
					
			match door_id :
				1:
					if u_dooravailble==true:
						newroom = room.instantiate()
						if newroom.d_dooravailble==true:
							newroom.global_position = u_room.global_position
							if room_id == 4 and Floormanager.floor_id!=5:
								
								
								newroom.global_position.y -=1219
						
							newroom.d_dooravailble=false
							
							get_parent().add_child(newroom)
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							if  newroom.overlapping_room_dectetor.has_overlapping_areas():
								print(fail_count)
								newroom.queue_free()
								fail_count+=1
							else:
								u_door.queue_free()
								newroom.d_door.queue_free()
								u_dooravailble =false
								num_of_availble_doors-=1
								
								added_rooms+=1
								num_of_rooms+=1
					
				2:
					if d_dooravailble==true:
						newroom = room.instantiate()
						if newroom.u_dooravailble==true:
							newroom.global_position = d_room.global_position
							newroom.u_dooravailble=false
							
							get_parent().add_child(newroom)
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							
							if  newroom.overlapping_room_dectetor.has_overlapping_areas():
								print(fail_count)
								fail_count+=1
								newroom.queue_free()
							else:
								newroom.u_door.queue_free()
								d_door.queue_free()
								d_dooravailble=false
								num_of_availble_doors-=1
								
								added_rooms+=1 
								num_of_rooms+=1
				3:
					if l_dooravailble==true:
						newroom = room.instantiate()
						if newroom.r_dooravailble==true:
							newroom.global_position = l_room.global_position
							
							if room_id ==3 and Floormanager.floor_id !=5:
								if Floormanager.floor_id == 4:
									newroom.global_position.x -= 708
									newroom.global_position.y -= 1264
								else:
									newroom.global_position.x -= 492 
									newroom.global_position.y -= 357
							elif room_id == 4 and Floormanager.floor_id !=5:
								if Floormanager.floor_id == 4:
									newroom.global_position.y -=77
									newroom.global_position.x +=770
								else:
									
									newroom.global_position.y -=1055
									newroom.global_position.x +=286
								
							newroom.r_dooravailble=false
							get_parent().add_child(newroom)
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							if  newroom.overlapping_room_dectetor.has_overlapping_areas():
								print(fail_count)
								
								newroom.queue_free()
								fail_count+=1
							else:
								newroom.r_door.queue_free()
								l_door.queue_free()
								l_dooravailble = false
								num_of_availble_doors-=1
								
								added_rooms+=1
								num_of_rooms+=1
				4:
					if r_dooravailble==true:
						newroom = room.instantiate()
						if newroom.l_dooravailble==true:
							newroom.global_position = r_room.global_position
							if room_id == 4 and Floormanager.floor_id !=5:
								
								newroom.global_position.x -=322
							newroom.l_dooravailble=false
							
							get_parent().add_child(newroom)
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							await get_tree().process_frame
							if  newroom.overlapping_room_dectetor.has_overlapping_areas():
								print(fail_count)
								fail_count+=1
								newroom.queue_free()
							else:
								newroom.l_door.queue_free()
								r_door.queue_free()
								num_of_availble_doors-=1
								
								r_dooravailble = false
								added_rooms+=1
								num_of_rooms+=1
		if fail_count>=10:
			print("reset")
			get_tree().reload_current_scene()
		else:
			get_parent().num_of_rooms+= added_rooms
			if newroom !=null :
				print("hi")
				newroom.addroom(max_rooms,get_parent().num_of_rooms)
	else:
		return
	
var enemycount= 0
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
		enemycount += 1
		enemy.connect("update_enemy_count",_on_test__enemy_update_enemy_count)
#logic to keep player trapped till all enemies are defeated 



func _on_test__enemy_update_enemy_count():
	enemycount-=1
	print(enemycount)
	if enemycount == 0:
		print("opening")
		$playerblockers.queue_free()
		cleared = true
	
	
	
	

var cleared = false


func _on_player_detector_body_entered(body):
	if cleared == false:
		for child in $enemies.get_children():
			if child is Enemy:
				child.enabled = true
		$playerblockers.visible=true
		var doors =$playerblockers.get_children()
		print("closing room")
		for door in doors:
			door.set_collision_layer_value(1,true)
