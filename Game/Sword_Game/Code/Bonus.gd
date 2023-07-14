extends Label

signal add_bonus(bonus)

var cash = false
var move_speed = 1
var limit = -15

var bonus = 0
var bonus_start = 100

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if bonus > 0:
		text = "+" + str(bonus)
	else:
		text = ""
	

	if cash:
		get_parent().position.y -= move_speed
		if get_parent().position.y <= limit:
			text = ""
			emit_signal("add_bonus", bonus)
			bonus = 0
			get_parent().position.y = 0
			cash = false
			


func _on_Player_bounce_at(_pos):
	if bonus < bonus_start:
		bonus = bonus_start
	else:
		bonus *= 2


func _on_Player_hit_ground(_pos):
	cash = true
