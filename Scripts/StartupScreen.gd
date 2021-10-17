extends Control

# player shown logo and a begin button
func _ready():
	$BeginButton.grab_focus()

# when player presses begin button takes them to main menu
func _on_BeginButton_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")
