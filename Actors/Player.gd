extends KinematicBody2D

# the movement variables (mess around with them to make the movement the way you like)
export (int) var speed = 300
export (int) var jump_speed = -600
export (int) var gravity = 1000
export (float, 0, 1.0) var friction = 0.25
export (float, 0, 1.0) var acceleration = 0.25

var velocity = Vector2.ZERO
var dark = false

onready var darkness = $darkness
# geting player input with our own function
func get_input():
	var dir = 0
	if Input.is_action_pressed("move_right"):
		dir += 1
	if Input.is_action_pressed("move_left"):
		dir -= 1
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)

# and finaly calculating the movement
func _physics_process(delta):
	
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("move_up"):

		if is_on_floor():
			velocity.y = jump_speed
	if Input.is_action_just_released("move_up"): # this will check to see if are jump key is released and stop the player jumping
		if sign(velocity.y) != 1:
			velocity.y = 0
			
			
