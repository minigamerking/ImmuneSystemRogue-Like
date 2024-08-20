extends Node2D
@export var max_rooms =10

@onready var load_screen = $"Load screen"


var num_of_rooms = 0
var connected_enemies = false
var loading = true
@export var SPEED := 400

@onready var f_2_starterroom = $f2_starterroom


@onready var player = $player

# Called when the node enters the scene tree for the first time.
func _ready():
	Floormanager.floor_id=2
	f_2_starterroom.addroom(max_rooms,num_of_rooms)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if num_of_rooms == max_rooms and not connected_enemies:
		get_parent().get_parent().find_child("player").find_child("PlayerManager").connect_enemies()
		load_screen.queue_free()
		connected_enemies = true
		Floormanager.floorgenerated=true
