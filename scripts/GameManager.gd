extends Node

signal room_entered(room)

var camera_position
var camera_zoom

func _ready():

	room_entered.connect(func(room):
		camera_position = room.global_position
		)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
