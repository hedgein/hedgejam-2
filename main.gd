extends Node2D
onready var darkness = $darkness
var dark = false

var light_level = 6
 
func _physics_process(delta):
	
	if Input.is_action_just_pressed("light_up"):
	#adds a light level when the add button is pressed
		light_level+=1
		if light_level > 6:
			light_level = 1
	if Input.is_action_just_pressed("light_down"):
	#subtracts a light level when the subtract button is pressed
		light_level-=1
		if light_level < 1:
			light_level = 6
	
	
