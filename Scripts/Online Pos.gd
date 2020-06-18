extends Node2D

remotesync var selected = false
remotesync var is_x = false
remotesync var is_o = false
	
remotesync func xclick():
	$x.show()

remotesync func oclick():
	$o.show()
	
	
remote func next():
	global.turn = true


func _on_Area2D_mouse_entered() -> void:
	$mouse_over.show()


func _on_Area2D_mouse_exited() -> void:
	$mouse_over.hide()
	

func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and !selected:
		if global.turn:
			if get_tree().get_network_unique_id() == 1:
				rpc("xclick")
				
			else:
				rpc("oclick")
			global.turn = false
			rpc("next")
			rset("selected", true)
