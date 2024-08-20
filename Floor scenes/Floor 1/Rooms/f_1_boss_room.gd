
extends Node2D

@onready var l_door = $l_Door
@onready var r_door = $r_Door
@onready var d_door = $d_Door
@onready var u_door = $u_Door
@onready var overlapping_room_dectetor = $overlapping_room_dectetor

var room
var floor 
@export var num_of_availble_doors = 4

var r_dooravailble=true

var u_dooravailble=true
var d_dooravailble=true

var l_dooravailble=true
# Called when the node enters the scene tree for the first time
func  addroom(max,cur):
	return
@onready var u_room = $u_room
@onready var d_room = $d_room
@onready var l_room = $l_room
@onready var r_room = $r_room




func _on_exit_body_entered(body):
	Floormanager.floorgenerated = false
	var dungeon = get_parent().get_parent()
	match Floormanager.floor_id:
		1:
			Floormanager.floor_id+=1
			floor = preload("res://Floor scenes/Floor2/floor_2.tscn")
			dungeon.find_child("floor_template").queue_free()
			dungeon.add_child(floor)
			dungeon.get_parent().find_child("player").global_position = Vector2(587,306)
		2:
			Floormanager.floor_id+=1
			floor = preload("res://Floor scenes/Floor 3/floor_3.tscn")
			dungeon.find_child("floor_2").queue_free()
			dungeon.add_child(floor)
			dungeon.get_parent().find_child("player").global_position = Vector2(587,306)
		3:
			Floormanager.floor_id+=1
			floor = preload("res://Floor scenes/Floor4/Rooms/floor_4.tscn")
			dungeon.find_child("floor_3").queue_free()
			dungeon.add_child(floor)
			dungeon.get_parent().find_child("player").global_position = Vector2(587,306)
		4:
			Floormanager.floor_id+=1
			floor = preload("res://Floor scenes/Floor5/Rooms/floor_5.tscn")
			dungeon.find_child("floor_4").queue_free()
			dungeon.add_child(floor)
			dungeon.get_parent().find_child("player").global_position = Vector2(587,306)
		
			
