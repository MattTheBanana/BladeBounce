extends Node2D

signal player_position(pos)
signal hit_ground(pos)
signal bounce_at(pos)

var katana = preload("res://Swords/Katana.tscn")
var khopesh = preload("res://Swords/Khopesh.tscn")
var swords = [katana, khopesh]
var sword

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	sword = swords[Global.theme].instance()
	add_child(sword)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func send_position(pos):
	emit_signal("player_position", pos)

func send_hit(full_pos):
	emit_signal("hit_ground", full_pos)

func send_bounce(full_pos):
	emit_signal("bounce_at", full_pos)

func _on_Arrow_arrow_angle(angle):
	get_child(0).arrow_angle(angle)
