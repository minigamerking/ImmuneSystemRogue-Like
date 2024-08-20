extends BasicRoom

func _ready():
	
	if r_dooravailble==false:
		num_of_availble_doors-=1
	if u_dooravailble== false:
		num_of_availble_doors-=1
	if d_dooravailble==false:
		num_of_availble_doors -=1
	if l_dooravailble==false:
		num_of_availble_doors-=1
	var enemies = $enemies.get_children()
	for enemy in enemies:
		enemy.connect("update_enemy_count",_on_test__enemy_update_enemy_count)
