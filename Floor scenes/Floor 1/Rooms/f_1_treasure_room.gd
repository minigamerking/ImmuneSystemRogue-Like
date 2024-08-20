extends Node2D

@onready var l_door = $l_Door
@onready var r_door = $r_Door
@onready var d_door = $d_Door
@onready var u_door = $u_Door
@onready var overlapping_room_dectetor = $overlapping_room_dectetor

var room
var upgrade=preload("res://Upgrades/dmg_up.tscn")
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

func  _ready():
	var upgrade_id =randi_range(1,6)
	match upgrade_id:
		1:
			upgrade =load("res://Upgrades/dmg_up.tscn")
		
		2:
			upgrade =load("res://Upgrades/fire_up.tscn")
		3:
			upgrade = load("res://Upgrades/clone_shooting.tscn")
		4:
			upgrade = load("res://Upgrades/health_up.tscn")
		5:
			upgrade = load("res://Upgrades/luck_upgrade.tscn")
		6:
			upgrade = load("res://Upgrades/cell_up.tscn")
	var new_upgrade = upgrade.instantiate()
	new_upgrade.global_position = $upgradepoint.global_position
	get_parent().add_child(new_upgrade)
