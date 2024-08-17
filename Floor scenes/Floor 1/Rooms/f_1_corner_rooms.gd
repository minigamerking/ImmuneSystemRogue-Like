extends Node2D

@onready var l_door = $l_Door
@onready var r_door = $r_Door
@onready var d_door = $d_Door
@onready var u_door = $u_Door

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
	if max_rooms >num_of_rooms:
		var rooms_to_add= randi_range(1,num_of_availble_doors)
		while num_of_rooms+rooms_to_add>max_rooms:
			rooms_to_add -=1
		var added_rooms =0
		var newroom
		while added_rooms<rooms_to_add:
			var door_id = randi_range(1,4)
			var room_id = randi_range(1,3)
			
			match room_id:
				1:
					room =preload("res://Floor scenes/Floor 1/Rooms/f_1_basicroom.tscn")
				2:
					room = preload("res://Floor scenes/Floor 1/Rooms/f_1_corner_rooms.tscn")
				3:
					room = preload("res://Floor scenes/Floor 1/Rooms/f_1_crosssectionroom.tscn")
			match door_id :
				1:
					if u_dooravailble==true and room_id != 3:
						newroom = room.instantiate()
						newroom.global_position = u_room.global_position
						newroom.d_dooravailble=true
						get_parent().add_child(newroom)
						u_door.visible = true
						u_dooravailble =false
						added_rooms+=1
				2:
					if d_dooravailble==true:
						newroom = room.instantiate()
						newroom.global_position = d_room.global_position
						newroom.u_dooravailble=false
						get_parent().add_child(newroom)
						d_door.visible = true
						d_dooravailble=false
						added_rooms+=1 
				3:
					if l_dooravailble==true:
						newroom = room.instantiate()
						newroom.global_position = l_room.global_position
						if room_id ==3:
							newroom.global_position.x -= 492 
							newroom.global_position.y -= 357
						newroom.r_dooravailble=false
						get_parent().add_child(newroom)
						l_door.visible = true
						l_dooravailble = false
						added_rooms+=1
				4:
					if r_dooravailble==true:
						newroom = room.instantiate()
						newroom.global_position = r_room.global_position
						newroom.l_dooravailble=false
						get_parent().add_child(newroom)
						r_door.visible = true
						r_dooravailble = false
						added_rooms+=1
		get_parent().num_of_rooms+= added_rooms
		if newroom !=null:
			print("hi")
			newroom.addroom(max_rooms,get_parent().num_of_rooms)
	else:
		return
	
	
	
	

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
