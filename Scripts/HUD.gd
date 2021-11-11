extends CanvasLayer

var coins = 0
var lives = 3

# Shows the players score on screen
func _ready():
	$AmmoCount/Ammo.text = String(coins)


# When player collides with ammo tin, counter goes up 1
func _on_ammo_collected():
	coins = coins + 1
	_ready()



