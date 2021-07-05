extends Control

func _ready():
	$HealthBar.max_value = PlayerStats.health_max
	
func _process(delta):
	$ScoreCount.text = "x " +PlayerStats.get_score()
	
