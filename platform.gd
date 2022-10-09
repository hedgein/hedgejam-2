extends StaticBody2D

var show_light_level: int

var light_level = 6

func _ready():
	show_light_level = randi()%6+1
	$Label.text = str(show_light_level)

func _physics_process(delta):
	if light_level == show_light_level:
		show()
	else:
		hide()
	if Input.is_action_just_pressed("light_down"):
		light_level-=1
		if light_level<1:
			light_level = 6
	if Input.is_action_just_pressed("light_up"):
		light_level+=1
		if light_level >6:
			light_level = 1
