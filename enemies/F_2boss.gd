extends  BOSS


@onready var shooting_cd = $shooting_cd


var canshoot = true
const ENEMY_PROJECTILE = preload("res://enemies/enemy_projectile.tscn")

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	stopdistance = 500
	

func _process(delta):
	set_target()
	if navigation_agent.is_target_reachable() and enabled and canshoot ==true:
		if int(navigation_agent.distance_to_target()):
			var new_projectile = ENEMY_PROJECTILE.instantiate()
			var direction = (player.global_position- self.global_position).normalized()
			new_projectile.direction = direction
			
			get_parent().add_child(new_projectile)
			new_projectile.global_position = self.global_position
			canshoot = false
	
func _physics_process(delta):
	path_find(delta)


func _on_shooting_cd_timeout():
	canshoot = true
