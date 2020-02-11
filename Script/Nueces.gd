extends ParallaxLayer

func _ready():
	pass

func _process(delta):
	motion_offset.x += 500*delta;
	