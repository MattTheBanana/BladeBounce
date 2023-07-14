extends Label

var base_score = 0
var bonus_score = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(base_score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text = str(base_score + bonus_score)



func _on_Player_player_position(pos):
	base_score = round(pos)-25


func _on_Bonus_add_bonus(bonus):
	bonus_score += bonus
