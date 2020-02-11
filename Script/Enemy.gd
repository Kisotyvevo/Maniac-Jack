extends KinematicBody2D

const gravity = 10
const SPEED = 30
const FLOOR = Vector2(0, -1)

var velocity = Vector2()
var direction = 1
var is_dead = false
var Stop = false

func _ready():
	pass

func dead():
	if is_dead == false:
		is_dead = true
		velocity = Vector2(0,0)
		$Muerte.play()
		$CollisionShape2D.disabled = true
		$CollisionShape2D.queue_free()
		$AnimatedSprite.play("dead")
		$Timer.start()

func _physics_process(delta):
	if is_dead == false:
		if Stop == false:
			velocity.x = SPEED * direction
			
			if direction == 1:
				$AnimatedSprite.flip_h = true
			else:
				$AnimatedSprite.flip_h = false
		
		$AnimatedSprite.play("Caminar")
		velocity.y += gravity
		
		
		velocity = move_and_slide(velocity, FLOOR)
	
	if is_on_wall():
		direction = direction * -1
		$RayCast2D.position.x *= -1
		
	if $RayCast2D.is_colliding() == false:
		direction = direction * -1
		$RayCast2D.position.x *= -1
	
	if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Player" in get_slide_collision(i).collider.name:
					get_slide_collision(i).collider.colision()
					#Stop = true
					$Timer2.start()

func _on_Timer_timeout():
	queue_free()


func _on_Timer2_timeout():
	Stop = false
	pass # Replace with function body.
