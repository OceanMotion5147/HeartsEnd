extends Area2D

signal ammo_collected

func _on_AmmoTin_1_body_entered(body):
	emit_signal("ammo_collected")
	queue_free()
