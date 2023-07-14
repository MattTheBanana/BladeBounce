extends StaticBody2D

var screen_bottom = 90
var screen_width = 160
var cutoff_range = 80
var scaffold_height = 16

var scaffold = preload("res://Scenes/Scaffold.tscn")
var s

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = rand_height()
	support()


func support():
	var height = screen_bottom - position.y
	var scaffolds = ceil(height/scaffold_height)
	
	for i in range(scaffolds):
		s = scaffold.instance()
		add_child(s)
		
		s.position.y = scaffold_height * i


func _physics_process(_delta):
	pass

func rand_height():
	return int(rand_range(screen_bottom/2, screen_bottom-4))


func _on_Player_player_position(pos):
	if position.x + cutoff_range < pos:
		for child in get_children():
			# Check if it's a scaffold:
			if child.get_filename() == scaffold.get_path():
				child.queue_free()
		
		position.x = pos + (screen_width * 1.7) - cutoff_range
		position.y = rand_height()
		support()
