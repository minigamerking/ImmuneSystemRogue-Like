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
	if playermanager.health <= 3:
		$CanvasLayer/GoldHealth/Heart1.visible = false
		$CanvasLayer/GoldHealth/Heart2.visible = false
		$CanvasLayer/GoldHealth/Heart3.visible = false
		$CanvasLayer/NinePatchRect2.visible = false
	if playermanager.health > 3:
		$CanvasLayer/NinePatchRect2.visible = true
	match playermanager.health:
		0:
			$CanvasLayer/RegularHealth/Heart1.visible = false
			$CanvasLayer/RegularHealth/Heart2.visible = false
			$CanvasLayer/RegularHealth/Heart3.visible = false
		1:
			$CanvasLayer/RegularHealth/Heart1.visible = true
			$CanvasLayer/RegularHealth/Heart2.visible = false
			$CanvasLayer/RegularHealth/Heart3.visible = false
		2:
			$CanvasLayer/RegularHealth/Heart1.visible = true
			$CanvasLayer/RegularHealth/Heart2.visible = true
			$CanvasLayer/RegularHealth/Heart3.visible = false
		3:
			$CanvasLayer/RegularHealth/Heart1.visible = true
			$CanvasLayer/RegularHealth/Heart2.visible = true
			$CanvasLayer/RegularHealth/Heart3.visible = true
		4:
			$CanvasLayer/RegularHealth/Heart1.visible = true
			$CanvasLayer/RegularHealth/Heart2.visible = true
			$CanvasLayer/RegularHealth/Heart3.visible = true
			$CanvasLayer/GoldHealth/Heart1.visible = true
			$CanvasLayer/GoldHealth/Heart2.visible = false
			$CanvasLayer/GoldHealth/Heart3.visible = false
		5:
			$CanvasLayer/RegularHealth/Heart1.visible = true
			$CanvasLayer/RegularHealth/Heart2.visible = true
			$CanvasLayer/RegularHealth/Heart3.visible = true
			$CanvasLayer/GoldHealth/Heart1.visible = true
			$CanvasLayer/GoldHealth/Heart2.visible = true
			$CanvasLayer/GoldHealth/Heart3.visible = false
		6:
			$CanvasLayer/RegularHealth/Heart1.visible = true
			$CanvasLayer/RegularHealth/Heart2.visible = true
			$CanvasLayer/RegularHealth/Heart3.visible = true
			$CanvasLayer/GoldHealth/Heart1.visible = true
			$CanvasLayer/GoldHealth/Heart2.visible = true
			$CanvasLayer/GoldHealth/Heart3.visible = true
		
