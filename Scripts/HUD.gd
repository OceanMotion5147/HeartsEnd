extends CanvasLayer

var coins = 0
var lives = 3

# Shows the players score on screen
func _ready():
	$AmmoCount/Ammo.text = String(coins)
	$LifeCount/Life.text = String(lives)
	


# When player collides with amoo tin, counter goes up 1
func _on_ammo_collected():
	coins = coins + 1
	_ready()



