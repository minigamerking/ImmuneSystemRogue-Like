extends Node2D
@export var max_rooms =5



var num_of_rooms = 0
var connected_enemies = false

@export var SPEED := 400

@onready var f_1_starterroom = $f1_starterroom

@onready var player = $player

# Called when the node enters the scene tree for the first time.
func _ready():
	f_1_starterroom.addroom(max_rooms,num_of_rooms)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if num_of_rooms == max_rooms and not connected_enemies:
		$player/PlayerManager.connect_enemies()
		connected_enemies = true
