extends Node2D

@onready var l_door = $l_Door
@onready var r_door = $r_Door
@onready var d_door = $d_Door
@onready var u_door = $u_Door
@onready var overlapping_room_dectetor = $overlapping_room_dectetor

var room

@export var num_of_availble_doors = 4

var r_dooravailble=true

var u_dooravailble=true
var d_dooravailble=true

var l_dooravailble=true
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
			var door_id = randi_range(1,4)
			var room_id = randi_range(1,4)
			
			match room_id:
				1:
					room =load("res://Floor scenes/Floor 3/f_3_cystroom.tscn")
				2:
					room = load("res://Floor scenes/Floor 3/f_3_wallroom.tscn")
				3:
					room = load("res://Floor scenes/Floor 3/f_3_pathroom.tscn")
				4:
					room =load("res://Floor scenes/Floor 3/f_3_scaredroom.tscn")
			match door_id :
				1:
					if u_dooravailble==true and room_id != 3:
						newroom = room.instantiate()
						newroom.global_position = u_room.global_position
						if room_id == 4:
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
							newroom.queue_free()
							fail_count+=1
						else:
							u_door.queue_free()
							newroom.d_door.queue_free()
							u_dooravailble =false
							added_rooms+=1
				2:
					if d_dooravailble==true:
						newroom = room.instantiate()
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
							fail_count+=1
							newroom.queue_free()
						else:
							newroom.u_door.queue_free()
							d_door.queue_free()
							d_dooravailble=false
							added_rooms+=1 
				3:
					if l_dooravailble==true:
						newroom = room.instantiate()
						newroom.global_position = l_room.global_position
						
						if room_id ==3:
							newroom.global_position.x -= 492 
							newroom.global_position.y -= 357
						elif room_id == 4:
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
							
							newroom.queue_free()
							fail_count+=1
						else:
							newroom.r_door.queue_free()
							l_door.queue_free()
							l_dooravailble = false
							added_rooms+=1
				4:
					if r_dooravailble==true:
						newroom = room.instantiate()
						newroom.global_position = r_room.global_position
						if room_id == 4:
							
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
							fail_count+=1
							newroom.queue_free()
						else:
							newroom.l_door.queue_free()
							r_door.queue_free()
							r_dooravailble = false
							added_rooms+=1
		if fail_count>=10:
			get_tree().reload_current_scene()
		else:
			get_parent().num_of_rooms+= added_rooms
			if newroom !=null:
				newroom.addroom(max_rooms,get_parent().num_of_rooms)
	else:
		return
	
func _ready():

	if r_dooravailble==false:
		num_of_availble_doors-=1
	if u_dooravailble== false:
		num_of_availble_doors-=1
	if d_dooravailble==false:
		num_of_availble_doors -=1
	if l_dooravailble==false:
		num_of_availble_doors-=1
# Called every frame. 'delta' is the elapsed time since the previous frame.
