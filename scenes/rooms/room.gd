extends Node2D

@onready var player: CharacterBody2D = $Player
# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.player = player
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		GameManager.room_entered.emit(self)
