extends KinematicBody2D

func _ready():
	pass

	if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Player" in get_slide_collision(i).collider.name:
					#get_slide_collision(i).collider.dead()
					pass
