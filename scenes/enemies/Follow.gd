extends State
class_name Follow

@export var enemy: CharacterBody2D
@export var move_speed := 25.0
var player: CharacterBody2D

func enter():
	player = get_tree().get_first_node_in_group("player")
	
func physics_update(delta: float):
	var direction = player.global_position - enemy.global_position
	
	if direction.length() > 7:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2()
	
	if direction.length() > 40: 
		Changed.emit(self, "Idle")
