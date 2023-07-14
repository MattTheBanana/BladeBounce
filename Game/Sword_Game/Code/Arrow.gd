extends Sprite

signal arrow_angle(angle)

var x_offset = 20
var y_offset = 20

var dir = 1
var speed = 0.05
var moving = true

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	rotation = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("jump"):
		moving = false

	if moving:
		if rotation <= PI/-2:
			dir = 1
		elif rotation >= 0:
			dir = -1
	
		rotation += dir*speed
		emit_signal("arrow_angle", rotation)

func _on_Player_hit_ground(pos):
	position = pos
	position.x += x_offset
	position.y -= y_offset
	moving = true
