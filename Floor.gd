extends Node2D
var max_rooms = 5

var num_of_rooms = 0

@export var SPEED := 400

@onready var f_1_starterroom = $f1_starterroom


# Called when the node enters the scene tree for the first time.
func _ready():
	f_1_starterroom.addroom(max_rooms,num_of_rooms)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("down"):
		$Camera2D.global_position.y += SPEED * delta
	if Input.is_action_pressed("up"):
		$Camera2D.global_position.y -= SPEED * delta
	if Input.is_action_pressed("right"):
		$Camera2D.global_position.x += SPEED * delta
	if Input.is_action_pressed("left"):
		$Camera2D.global_position.x -= SPEED * delta
