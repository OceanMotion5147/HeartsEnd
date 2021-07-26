extends CanvasLayer

var coins = 0

func _ready():
	$Ammo.text = String(coins)



func _on_ammo_collected():
	coins = coins + 1
	_ready()

