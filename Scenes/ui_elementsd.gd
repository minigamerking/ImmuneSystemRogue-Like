extends Control

var player : Player
var playermanager : Playermanager

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("Player")
	playermanager = get_parent().find_child("player").find_child("PlayerManager")
	$CanvasLayer.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playermanager.health == 2:
		$CanvasLayer/HBoxContainer/Heart3.visible = false
	if playermanager.health == 1:
		$CanvasLayer/HBoxContainer/Heart2.visible = false
	if playermanager.health == 0:
		$CanvasLayer/HBoxContainer/Heart1.visible = false
	if playermanager.health == 3:
		$CanvasLayer/HBoxContainer/Heart1.visible = true
		$CanvasLayer/HBoxContainer/Heart2.visible = true
		$CanvasLayer/HBoxContainer/Heart3.visible = true
		
