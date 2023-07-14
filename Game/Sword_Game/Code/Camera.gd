extends Camera2D

var player_pos = 25
var distance_from_left = 25

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player_pos > position.x + distance_from_left:
		position.x = player_pos - 25


func _on_Player_player_position(pos):
	player_pos = pos
