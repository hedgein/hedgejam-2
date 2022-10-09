extends Node2D

var platform_scene = preload("res://platform.tscn")
func _ready():
	for i in range(-5,5):
		var platform = platform_scene.instance()
		add_child(platform)
		platform.position.x = i*$Player.position.x
		platform.position.y = 250
