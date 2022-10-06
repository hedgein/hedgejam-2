extends Node2D
onready var darkness = $darkness
var dark = false

func _physics_process(delta):
	darkness.visible = dark
	if Input.is_action_just_pressed("jump") and get_node("Player").is_on_floor():
		if dark == false:
			dark = true
		else:
			dark = false
