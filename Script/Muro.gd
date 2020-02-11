extends StaticBody2D

func _ready():
	pass


func _on_Palanca2_body_entered(body):
	if "Player" in body.name:
		$"../Palanca2/Palanca2 anim".play("Off")
		$".".visible = false
		$CollisionShape2D.disabled = true
		$Timer.start()


func _on_Timer_timeout():
	queue_free()
