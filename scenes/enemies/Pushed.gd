extends State
class_name Pushed

@export var push_speed := 100.0
@export var push_time := 0
@export var enemy: CharacterBody2D

var pushed_speed = 0.0

var push_direction = Vector2.ZERO

func enter():
	pushed_speed = push_speed

func _physics_process(delta):
	if push_time > 0:
		var speed = pushed_speed / push_time
		enemy.velocity = push_direction * pushed_speed
		pushed_speed -= speed
		push_time -=delta
		
	if push_time == 0:
		Changed.emit(self, "Idle")

func _on_enemy_pushed(direction: Vector2):
	Changed.emit(enemy.find_child("State").current_state, "Pushed")
	push_time = 12
	push_direction = direction
