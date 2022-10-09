extends KinematicBody2D

# the movement variables (mess around with them to make the movement the way you like)
export (int) var FACTOR = 5.5
var MAX_SPEED = 90
var FRICTION = 900 
var ACCEL = 1000 
#export (int) var speed_factor = 1.0
export (int) var jump_speed = -600
export (int) var gravity = 1000
export (float, 0, 1.0) var friction = 0.25
export (float, 0, 1.0) var acceleration = 0.25

var velocity = Vector2.ZERO
var dark = false

onready var darkness = $darkness
# geting player input with our own function
func get_input(delta):
	var dir = 0
	if Input.is_action_pressed("move_right"):
		dir += 1
	if Input.is_action_pressed("move_left"):
		dir -= 1
	# 6 frame acceleration?? (Not sure if i remember 
	# how to check this, but fingers crossed
	#!((time_start + delta) > OS.get_unix_time())
	if abs(velocity.x) >= MAX_SPEED * FACTOR and sign(velocity.x) == dir:
		velocity.x = move_toward(velocity.x, dir * MAX_SPEED * FACTOR, FRICTION * FACTOR * delta)
	else:
		velocity.x = move_toward(velocity.x, dir * MAX_SPEED * FACTOR , ACCEL * FACTOR * delta)
#	else:
#		velocity.x = lerp(velocity.x, 0, friction)

# and finaly calculating the movement
func _physics_process(delta):
	
	get_input(delta)
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_pressed("jump"):

		if is_on_floor():
			velocity.y = jump_speed
	if Input.is_action_just_released("jump"): # this will check to see if are jump key is released and stop the player jumping
		if sign(velocity.y) != 1:
			velocity.y = 0
			
			
