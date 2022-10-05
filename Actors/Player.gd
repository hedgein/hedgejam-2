extends Area2D

#set up variables
export var speed = 300 #pixels/sec
export var weight = 600
export var jump_weight = 1000
var screen_size 
var player_gravity: Vector2 
var player_jump : Vector2
var velocity: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size



func _process(delta):
	velocity = Vector2.ZERO
	player_gravity = Vector2.DOWN 
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("jump"):
		player_jump = Vector2.UP * jump_weight
	else:
		player_jump = Vector2.ZERO
		
	if velocity.length() > 0:
		player_gravity = player_gravity * weight
		velocity = velocity.normalized() * speed
	else:
		player_gravity = player_gravity * weight
		
	position += (velocity + player_gravity + player_jump)* delta 

	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
