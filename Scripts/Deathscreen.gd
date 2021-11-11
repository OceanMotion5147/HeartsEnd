extends Control

#Deathscreen that appears when player loses all lives. Only option is to quit game
func _ready():
	$QuitButton.grab_focus()

func _on_QuitButton_pressed():
	get_tree().quit
