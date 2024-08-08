extends Node2D

@export var knifePosition: Vector2
@export var knifeRotation: float

func _ready():
	position = knifePosition
	rotation = deg_to_rad(knifeRotation)

func _physics_process(delta):
	position = knifePosition
	rotation = deg_to_rad(knifeRotation)

func _on_body_entered(body):
	if body is Enemy:
		var direction = Vector2(0, 1)
		if knifePosition.x < 0: direction =  Vector2(-1, 0)
		elif knifePosition.x > 0: direction =  Vector2(1, 0)
		elif knifePosition.y < 0: direction = Vector2(0,1)
		print(direction)
		body.get_hit(direction)
