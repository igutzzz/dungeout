extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.room_entered.connect(func(room):
		position = room.global_position
		)
	
func _process(delta):
	if GameManager.camera_position != position:
		position = GameManager.camera_position
