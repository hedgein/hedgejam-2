extends Node2D

onready var lights = $LightOrDark
onready var light_platforms = get_tree().get_nodes_in_group("light")
onready var dark_platforms = get_tree().get_nodes_in_group("dark")
func _ready():
	for platform in dark_platforms:
		platform.visible = false
		platform.get_child(0).disabled = true

func _physics_process(delta):
	if Input.is_action_just_pressed("lights_on_off") and lights.visible:
		lights.hide()
	elif Input.is_action_just_pressed("lights_on_off") and !lights.visible:
		lights.show()

func _on_LightOrDark_visibility_changed():
	switch_on_off_platforms(light_platforms)
	switch_on_off_platforms(dark_platforms)
	
func switch_on_off_platforms(platforms):
	for platform in platforms:
		platform.visible = !platform.visible
		platform.get_child(0).disabled = !platform.get_child(0).disabled
