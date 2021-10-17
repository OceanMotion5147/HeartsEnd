extends Control

func _ready():
	$VBoxContainer/StartButton.grab_focus()

# When player presses start the game loads level 1
func _on_StartButton_pressed():
	get_tree().change_scene("res://World.tscn")

# When player presses quit the game closes
func _on_Quit_Button_pressed():
	get_tree().quit


