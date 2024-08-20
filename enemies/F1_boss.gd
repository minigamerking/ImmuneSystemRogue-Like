class_name BOSS
extends Enemy


func takedmg(dmg):
	hp-=dmg
	print(hp)
	if hp <=0:
		Floormanager.bossdefeated=true
		queue_free()
		
