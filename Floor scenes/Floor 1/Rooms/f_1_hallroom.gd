extends BasicRoom

func _ready():
	is_hall =true
	
	if r_dooravailble==false:
		num_of_availble_doors-=1
	if u_dooravailble== false:
		num_of_availble_doors-=1
	if d_dooravailble==false:
		num_of_availble_doors -=1
	if l_dooravailble==false:
		num_of_availble_doors-=1
