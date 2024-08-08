extends CharacterBody2D
class_name Enemy
signal Pushed
@onready var label = $Label

@export var life := 3
var is_push = false

func _process(delta):
	label.text = str(life)
	if life == 0:
		queue_free()

func _physics_process(delta):
	move_and_slide()
	
func get_hit(direction: Vector2):
	life -= 1
	Pushed.emit(direction)
	
