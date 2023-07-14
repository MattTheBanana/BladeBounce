extends KinematicBody2D

var velocity = Vector2()

var GRAVITY = 500
var jump_strength = 210
var angle = 0


var death_line = 120


var spin = 0
var falling = true
var ghost_stab = false

var bounce_pitch_normal = 0.5
var bounce_step = 0.08
var bounce_pitch = bounce_pitch_normal
var bounce_list = [0, 1, 2, 3, 4, 5, 6, 7, 8]

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 25


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("reset"):
		# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()
		
	if Input.is_action_just_pressed("jump"):
		if not falling:
			$Jump.play()
			jump()


	if falling:
		rotation += spin
		velocity.y+=delta*GRAVITY
		velocity = move_and_slide(velocity, Vector2.UP)
		
		
		if position.y > death_line:
			# warning-ignore:return_value_discarded
			get_tree().change_scene("res://Scenes/Menu.tscn")
	
	get_parent().send_position(position.x)



func bounce():
	angle = rand_range(PI/-2, PI/-4)
	$Bounce.pitch_scale = bounce_pitch
	#$Bounce.pitch_scale = bounce_pitch_normal + (bounce_list[bounce_pitch]/12.0)
	$Bounce.play()
	bounce_pitch += bounce_step
	#bounce_pitch = min(len(bounce_list)-1, bounce_pitch)
	get_parent().send_bounce(position)
	jump()
	#velocity.y = -jump_strength


func jump():
	velocity.y = sin(angle) * jump_strength
	velocity.x = cos(angle) * jump_strength
	spin = rand_range(0.01, 0.2)
	falling = true

func stab():
	$Land.play()
	velocity = Vector2(0, 0)
	falling = false
	ghost_stab = false
	get_parent().send_hit(position)
	bounce_pitch = bounce_pitch_normal


func _on_Hilt_body_entered(_body):
	if velocity.y >= 0:
		if ghost_stab:
			stab()
		else:
			ghost_stab = false
			bounce()


func _on_Blade_body_entered(_body):
	if velocity.y >= 0:
		stab()
	else:
		ghost_stab = true



func _on_Blade_body_exited(_body):
	ghost_stab = false


func arrow_angle(new_angle):
	if not falling:
		angle = new_angle

