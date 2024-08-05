extends Node

var number_of_rooms = 10

var camera_position
var camera_zoom

func _ready():

	camera_position = get_tree().get_first_node_in_group("camera").position
	camera_zoom = get_tree().get_first_node_in_group("camera").zoom


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
