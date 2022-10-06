extends Node2D



func _on_Button_button_down():
	get_tree().change_scene("res://main.tscn")


func _on_Button2_button_down():
	get_tree().change_scene("res://credits.tscn")
