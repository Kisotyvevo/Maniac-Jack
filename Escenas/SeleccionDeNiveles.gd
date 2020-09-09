extends Node2D
var Mundo1 = "res://Escenas/Mundo.tscn"
var Mundo2 = "res://Escenas/Mundo2.tscn"
var Mundo3 = "res://Escenas/Mundo.tscn"
var boton2bloqueado = true
var boton3bloqueado = true
func _ready():
	Controlador.nivel1Complete
	Controlador.nivel2Complete
	pass 


func _process(delta):
	desbloquearboton2()
	desbloquearboton3()
	
	if boton2bloqueado == true:
		$Button2.visible = false
	else:
		$Button2.visible = true
		$Sprite.visible = false
	if boton3bloqueado == true:
		$Button3.visible = false
	else:
		$Button3.visible = true
	



func _on_Button_pressed():
	get_tree().change_scene("res://Escenas/Mundo.tscn")


func desbloquearboton2():
	if get_tree().get_nodes_in_group("control")[0].nivel1Complete == true:
		boton2bloqueado = false

func desbloquearboton3():
	if Controlador.nivel2Complete == true:
		boton3bloqueado = false


func _on_Button2_pressed():
	if boton2bloqueado == false:
		get_tree().change_scene("res://Escenas/Mundo 2.tscn")
	else:
		pass
	pass



func _on_Button3_pressed():
	if boton3bloqueado == false:
		get_tree().change_scene("res://Escenas/Mundo 3.tscn")
	else:
		pass
	pass


func _on_volver_atras_pressed():
	get_tree().change_scene("res://Escenas/Titles.tscn")
