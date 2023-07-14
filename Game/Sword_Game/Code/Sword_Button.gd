extends TouchScreenButton

var outline = load("res://Materials/Outline.tres")
var none = load("res://Materials/Normal.tres")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.theme == $Type.position.x:
		set_material(outline)
	else:
		set_material(none)


func _on_Japanese_pressed():
	Global.theme = 0


func _on_Egyptian_pressed():
	Global.theme = 1
