extends Area2D

#Plays animation for spiketrap
func _ready():
	$AnimationPlayer.play("SpikeTrigger")

#if player in collision area of spike trap when it activates player takes damage and loses 1 heart
func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		Livecounter.lives -=1
