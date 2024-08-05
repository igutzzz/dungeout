extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	position = GameManager.camera_position
	
func _process(delta):
	if GameManager.camera_position != position:
		position = GameManager.camera_position


## USE THE MOUSE WHEEL TO ZOOM IN/ZOOM OUT, AND LEFT MOUSE BUTTON TO DRAG THE CAMERA

func _input(event):
	if event.get_action_strength("mouse_up"):
		zoom = clamp(zoom + Vector2.ONE * 0.01 ,Vector2.ONE * 0.1,Vector2.ONE * 5.0)
	
	if event.get_action_strength("mouse_down"):
		zoom = clamp(zoom - Vector2.ONE * 0.01 ,Vector2.ONE * 0.1,Vector2.ONE * 5.0)
	
	if event is InputEventMouseMotion and Input.is_action_pressed("MLB"):
		global_position -= event.relative / zoom
