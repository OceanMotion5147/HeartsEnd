extends Control

func _ready():
	$VBoxContainer/StartButton.grab_focus()

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/World.tscn")


func _on_Quit_Button_pressed():
	get_tree().quit


