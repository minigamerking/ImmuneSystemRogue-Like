extends Node2D
var max_rooms = 10

var num_of_rooms = 0

@onready var f_1_starterroom = $f1_starterroom


# Called when the node enters the scene tree for the first time.
func _ready():
	f_1_starterroom.addroom(max_rooms,num_of_rooms)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
