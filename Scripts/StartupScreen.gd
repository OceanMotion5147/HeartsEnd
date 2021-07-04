extends Control

func _ready():
	$BeginButton.grab_focus()

func _on_BeginButton_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")
