extends Node2D


func _ready():
	Livecounter.lives=3
	
#hearts are removed when player takes damage
func _physics_process(delta):
	
	if Livecounter.lives == 2:
		$Live3.hide()
	if Livecounter.lives == 1:
		$Live2.hide()
	if Livecounter.lives == 0:
		#death screen shown when all lives lost
		get_tree().change_scene("res://Deathscreen.tscn")
	
	
