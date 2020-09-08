extends StaticBody2D

func _ready():
	pass


func _on_Palanca3_body_entered(body):
	if "Player" in body.name:
		$"../Palanca3/Palanca3 anim".play("Off")
		$".".visible = false
		$CollisionShape2D.disabled = true
		$Timer.start()


func _on_Timer_timeout():
	queue_free()
