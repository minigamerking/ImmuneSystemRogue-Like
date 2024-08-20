extends Control
@onready var rich_text_label = $CanvasLayer/RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	match Floormanager.floor_id:
		2:
			rich_text_label.text ="By wreacking havock upon the bloodstrean you have grown stronger\n you have succefully made a platelet cell your new host\n Your next stop...the liver"
		3: 
			rich_text_label.text = "With The kidneys left in ruin you lay claim to a red blood cell as your new host\nThe lungs await "
		4:
			rich_text_label.text = "The lungs now remain a shell of thier former self ,\n But it matters not for you have bested the White blood cell and lay claim to it as your host\n No stopping now go for the heart"
		5:
			rich_text_label.text = "The heart beaten and batter.\nNot even the might Killer T Cells could stand up to you\n time to finish this......its the for the brain"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
