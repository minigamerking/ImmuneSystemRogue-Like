extends Node2D
var maxrooms=15
var num_of_rooms =0
@onready var f_2_starterroom = $f2_starterroom

# Called when the node enters the scene tree for the first time.
func _ready():
	f_2_starterroom.addroom(maxrooms,num_of_rooms)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
