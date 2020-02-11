extends KinematicBody2D

func _ready():
	pass

	if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Player" in get_slide_collision(i).collider.name:
					get_slide_collision(i).collider.dead()



func _on_Palanca1_body_entered(body):
	if "Player" in body.name:
			$"../../Palanca1/Palanca anim".play("Off")
			$CollisionShape2D.disabled = true
			$".".visible = false
			$Timer.start()
			

func _on_Timer_timeout():
	queue_free()
