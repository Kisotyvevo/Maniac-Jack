extends Node
var Mundo = "res://Escenas/Mundo.tscn"
var selecLevel = "res://Escenas/SeleccionDeNiveles.tscn"

func _ready():
	pass
func _process(delta):
	if Input.is_action_just_pressed("cerrar juego"):
		get_tree().quit()
	if Input.is_action_just_pressed("ui_accept"):
		$"Loading".visible = true
		$Inicio.visible = false
		$Creditos.visible = false
		$MarginContainer/VBoxContainer/TextureRect.visible = false
		$Nuces/Sprite.visible = false
		$Nuces/Sprite2.visible = false
		$Nuces/Sprite3.visible = false
		$Nuces/Sprite4.visible = false
		$Nuces/Sprite5.visible = false
		$Nuces/Sprite6.visible = false
		$Creditos2.visible = false
		get_tree().change_scene("res://Escenas/SeleccionDeNiveles.tscn")
		#$Loading/AnimatedSprite.play("Cargando")
		#$Timer.start()
		load(selecLevel)
func _on_Inicio_pressed():
	$"Loading".visible = true
	$Inicio.visible = false
	$Creditos.visible = false
	$MarginContainer/VBoxContainer/TextureRect.visible = false
	$Nuces/Sprite.visible = false
	$Nuces/Sprite2.visible = false
	$Nuces/Sprite3.visible = false
	$Nuces/Sprite4.visible = false
	$Nuces/Sprite5.visible = false
	$Nuces/Sprite6.visible = false
	get_tree().change_scene("res://Escenas/SeleccionDeNiveles.tscn")
	#$Loading/AnimatedSprite.play("Cargando")
	#$Timer.start()
	load(selecLevel)


func _on_ButtonInicio_pressed():
	
	pass

func _on_Creditos_pressed():
	$Creditos2.visible = true
	$Creditos.visible = false


func _on_Atras_pressed():
	$Creditos2.visible = false
	$Creditos.visible = true

func _physics_process(delta):
	if Input.is_action_pressed("ui_select"):
		get_tree().quit()
	if Input.is_action_pressed("ui_up"):
		get_tree().change_scene("res://Escenas/SeleccionDeNiveles.tscn")


func _on_Timer_timeout():
	get_tree().change_scene("res://Escenas/SeleccionDeNiveles.tscn")
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().quit()
