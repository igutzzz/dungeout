extends CharacterBody2D

@export var speed: int =55
@onready var animation = $AnimationPlayer
@onready var knife: Node2D = get_node("Knife")

@onready var attack_timer = $AttackTimer
@export var BALL = preload("res://scenes/projectiles/bullet.tscn")
@export var min_accuracy = 0.9

var direction = Vector2.ZERO

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
	direction = self.get_direction()
	
	if Input.is_action_just_pressed("MLB") && attack_timer.is_stopped():
		var ball_direction = self.global_position.direction_to(get_global_mouse_position())
		throw_ball(ball_direction)
	
func get_direction():
	return global_position.direction_to(get_global_mouse_position())
	
func throw_ball(direction: Vector2):
	var rand_accuracy = randf_range(min_accuracy, 1)
	print(rand_accuracy)
	if BALL:
		var ball = BALL.instantiate()
		get_tree().current_scene.add_child(ball)
		ball.global_position = self.global_position
		var rotation = direction.angle()
		ball.rotation = rotation * rand_accuracy
		attack_timer.start()
