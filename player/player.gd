extends CharacterBody2D

@export var speed: int =55
@onready var animation = $AnimationPlayer
@onready var knife: Node2D = get_node("Knife")

func handleInput():
	var moveDirection = Input.get_vector( "ui_left", "ui_right","ui_up", "ui_down")
	velocity = moveDirection * speed
	
func updateAnimation():
	if velocity.length() == 0:
		animation.stop()
	else:
		var direction = "Down"
		if velocity.x < 0: direction = "Left"
		elif velocity.x > 0: direction = "Right"
		elif velocity.y < 0: direction = "Up"
		animation.play("walk" + direction)

func  _physics_process(delta):
	handleInput()
	move_and_slide()
	updateAnimation()
	
func get_direction():
	return global_position.direction_to(get_global_mouse_position())
