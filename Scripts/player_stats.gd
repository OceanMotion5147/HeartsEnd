extends Node

var lives
var lives_max = 3
var score

func _ready():
	score = 0
	lives = 3
	
	
func change_lives(amount):
	lives += amount
	lives =  clamp(lives,0,lives_max)
	
func get_lives():
	return lives

