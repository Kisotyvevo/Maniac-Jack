extends KinematicBody2D

export (int) var Speed 
export (int) var gravity
const jump_power = -250
const FLOOR = Vector2(0, -1)

const FIREBALL = preload("res://Escenas/Fireball.tscn")

var velocity = Vector2()
var on_ground = false
var is_dead = false
var Agachado = false
var Vida = 3
var Dano = false
var Limite = false
var Saltar = false
var Adelante = false
var Atras = false
var Disparar = false
var Dano2 = false
var Segundos = 60
var Minutos = 1
var Delay = false

func _ready():
	$Timer5.start()
	$Camera2D/TouchScreenButton5.hide()

func _physics_process(delta):
	Quieto()
	Saltar()
	CorrerAdelante()
	CorrerAtras()
	Disparar()
	DescontarMinutos()
	DescontarSegundos()
	$RichTextLabel.text = str(Minutos, " : ",Segundos)
	#print(Saltar)
	print(Segundos)
	print(Minutos)
	
	if is_dead == false:
		
		if Input.is_action_pressed("ui_right"):
			Adelante = true
		if Input.is_action_just_released("ui_right"):
			Adelante = false
			
		if Input.is_action_pressed("ui_left"):
			Atras = true
		if Input.is_action_just_released("ui_left"):
			Atras = false
			
#		else:
#			if Adelante == true:
#				if Atras == false:
#					velocity.x = 0
#					if Agachado == false:
#						if on_ground == true:
#							$AnimatedSprite.play("Idle")
#				
		if Input.is_action_pressed("ui_down"):
			Agachado = true
			velocity.x = 0
			$AnimatedSprite.play("Agachado")
		if Input.is_action_just_released("ui_down"):
			Agachado = false
		
		if Input.is_action_pressed("ui_up"):
			Saltar = true
		if Input.is_action_just_released("ui_up"):
			Saltar = false

		
		if Input.is_action_just_pressed("ui_focus_next"):
			if Limite == false:
				Limite = true
				$Timer3.start()
				var Fireball = FIREBALL.instance()
				get_parent().add_child(Fireball)
				Fireball.position = $Position2D.global_position
			
				if sign($Position2D.position.x) == 1:
					Fireball.set_fireball_direction(1)
					$Disparo.play()
				else:
					Fireball.set_fireball_direction(-1)
					$Disparo.play()

			
	
		velocity.y += gravity
		
		if is_on_floor():
			on_ground = true
		else:
			if Saltar == true:
				on_ground = false
				if velocity.y < 0:
					$AnimatedSprite.play("Jump")
			#else:
				#$AnimatedSprite.play("Jump")
		
		
		velocity = move_and_slide(velocity, FLOOR)
		
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Enemy" in get_slide_collision(i).collider.name:
					colision()
					
		
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Espinas" in get_slide_collision(i).collider.name:
					colision()
					
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Trampa" in get_slide_collision(i).collider.name:
					if Dano == false:
						Dano = true
						Vida -= 1
						$Timer2.start()
						
		if Vida == 2:
			$Camera2D/vidas/Vida3.play("NoVida")
				
		if Vida == 1:
			$Camera2D/vidas/Vida2.play("NoVida")
				
		if Vida == 0:
			$Camera2D/vidas/Vida.play("NoVida")
			Vida -= 1
			dead()
			
func dead():
	is_dead = true
	velocity = Vector2(0,0)
	$"Audio del nivel".stop()
	$Perder.play()
	$AnimatedSprite.play("Hurt")
	$CollisionShape2D.disabled = true
	$Timer.start()
	
	
func colision():
	if Dano == false:
		velocity.y = jump_power
		on_ground = false 
		Dano = true
		Dano2 = true
		Vida -= 1
		$AnimatedSprite.play("Hurt")
		$Timer2.start()
		$Timer4.start()
						
func _on_Timer_timeout():
	get_tree().change_scene("res://Escenas/Titles.tscn")


func _on_Timer2_timeout():
	Dano = false
	pass # Replace with function body.


func _on_Timer3_timeout():
	Limite = false
	pass # Replace with function body.


func _on_TouchScreenButton_pressed():
	Atras = true
	$Timer5.stop()
	MostrarBotones()
	pass # Replace with function body.


func _on_TouchScreenButton2_pressed():
	Adelante = true
	$Timer5.stop()
	MostrarBotones()
	pass # Replace with function body.


func _on_TouchScreenButton3_pressed():
	Saltar = true
	$Timer5.stop()
	MostrarBotones()
	pass # Replace with function body.


func _on_TouchScreenButton4_pressed():
	Disparar = true
	$Timer5.stop()
	MostrarBotones()
	pass # Replace with function body.



func _on_TouchScreenButton3_released():
	Saltar = false
	$Timer5.start()
	MostrarBotones()
	pass # Replace with function body.

func Saltar():
	if Saltar == true:
		if Agachado == false:
			if on_ground == true:
				velocity.y = jump_power
				on_ground = false 
				if $Salto.playing == false:
					$Salto.play()
					$Pasos.stop()

func CorrerAdelante():
	if Adelante == true:
		if Agachado == false:
			velocity.x = Speed
			if on_ground == true:
				Pasos()
				$AnimatedSprite.play("Run")
				$AnimatedSprite.flip_h = false
				if sign($Position2D.position.x) == -1:
					$Position2D.position.x *= -1
					
func CorrerAtras():
	if Atras == true:
		if Agachado == false:
			velocity.x = -Speed
			if on_ground == true:
				Pasos()
				$AnimatedSprite.play("Run")
				$AnimatedSprite.flip_h = true
				if sign($Position2D.position.x) == 1:
					$Position2D.position.x *= -1
					
func Disparar():
	if Disparar == true:
		if Limite == false:
			Limite = true
			$Timer3.start()
			var Fireball = FIREBALL.instance()
			get_parent().add_child(Fireball)
			Fireball.position = $Position2D.global_position
			if sign($Position2D.position.x) == 1:
				Fireball.set_fireball_direction(1)
				$Disparo.play()
			else:
				Fireball.set_fireball_direction(-1)
				$Disparo.play()

func _on_TouchScreenButton_released():
	Atras = false
	Quieto()
	$Timer5.start()
	pass # Replace with function body.

func _on_TouchScreenButton4_released():
	Disparar = false
	$Timer5.start()
	pass # Replace with function body.


func _on_TouchScreenButton2_released():
	Adelante = false
	Quieto()
	$Timer5.start()
	pass # Replace with function body.
	
func Quieto():
	if Dano2 == false:
		if Adelante == false:
			if Atras == false:
				velocity.x = 0
				if Agachado == false:
					if on_ground == true:
						$AnimatedSprite.play("Idle")
						$Pasos.stop()


func _on_Timer4_timeout():
	Dano2 = false
	pass # Replace with function body.


func _on_Timer5_timeout():
	OcultarBotones()
	pass # Replace with function body.

func OcultarBotones():
	$Camera2D/TouchScreenButton.hide()
	$Camera2D/TouchScreenButton2.hide()
	$Camera2D/TouchScreenButton3.hide()
	$Camera2D/TouchScreenButton4.hide()
	$Camera2D/TouchScreenButton5.show()
	pass

func MostrarBotones():
	$Camera2D/TouchScreenButton.show()
	$Camera2D/TouchScreenButton2.show()
	$Camera2D/TouchScreenButton3.show()
	$Camera2D/TouchScreenButton4.show()
	$Camera2D/TouchScreenButton5.hide()
	pass


func _on_TouchScreenButton5_pressed():
	MostrarBotones()
	pass # Replace with function body.
	
func DescontarMinutos():
	if Segundos == 0:
		Segundos = 60
		Minutos -= 1

func DescontarSegundos():
	if Delay == false:
		if Segundos >= 1:
			Delay = true
			Segundos -= 1
			$Timer6.start()
			
func _on_Timer6_timeout():
	Delay = false
	pass # Replace with function body.


func _on_Pasos_finished():
	$Pasos.play()
	pass # Replace with function body.
	
func Pasos():
	if $Pasos.playing == false:
		$Pasos.play()
