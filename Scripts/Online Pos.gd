extends Node2D

remotesync var selected = false
remotesync var is_x = false
remotesync var is_o = false
	
remotesync func xclick():
	$x.show()
	rset("is_x", true)

remotesync func oclick():
	$o.show()
	rset("is_o", true)
	
	
remote func next():
	global.turn = true

func win():
	get_node("..").get_parent().get_node("WIN").show()
	
remote func lose():
	get_node("..").get_parent().get_node("LOSE").show()
	

func o_win(positions, index) -> bool:
	if positions[index].is_o:
		var res = 1
		var temp = index
		while temp % 11 > 0:
			temp -= 1
			if positions[temp].is_o:
				res += 1
			else: break
		temp = index
		while temp % 11 < 10:
			temp += 1
			if positions[temp].is_o:
				res += 1
			else: break
		if res >= 5: return true
		else: res = 1
		
		temp = index
		while temp > 10:
			temp -= 11
			if positions[temp].is_o:
				res += 1
			else: break
		temp = index
		while temp < 110:
			temp += 11
			if positions[temp].is_o:
				res += 1
			else: break
		if res >= 5: return true
		else: res = 1
		
		temp = index
		while temp > 10 and temp % 11 > 0:
			temp -= 12
			if positions[temp].is_o:
				res += 1
			else: break
		temp = index
		while temp < 110 and temp % 11 < 10:
			temp += 12
			if positions[temp].is_o:
				res += 1
			else: break
		if res >= 5: return true
		else: res = 1
		
		temp = index
		while temp > 10 and temp % 11 < 10:
			temp -= 10
			if positions[temp].is_o:
				res += 1
			else: break
		temp = index
		while temp < 110 and temp % 11 > 0:
			temp += 10
			if positions[temp].is_o:
				res += 1
			else: break
		if res >= 5: return true
		else: res = 1
		
	return false


func x_win(positions, index) -> bool:
	if positions[index].is_x:
		var res = 1
		var temp = index
		while temp % 11 > 0:
			temp -= 1
			if positions[temp].is_x:
				res += 1
			else: break
		temp = index
		while temp % 11 < 10:
			temp += 1
			if positions[temp].is_x:
				res += 1
			else: break
		if res >= 5: return true
		else: res = 1
		
		temp = index
		while temp > 10:
			temp -= 11
			if positions[temp].is_x:
				res += 1
			else: break
		temp = index
		while temp < 110:
			temp += 11
			if positions[temp].is_x:
				res += 1
			else: break
		if res >= 5: return true
		else: res = 1
		
		temp = index
		while temp > 10 and temp % 11 > 0:
			temp -= 12
			if positions[temp].is_x:
				res += 1
			else: break
		temp = index
		while temp < 110 and temp % 11 < 10:
			temp += 12
			if positions[temp].is_x:
				res += 1
			else: break
		if res >= 5: return true
		else: res = 1
		
		temp = index
		while temp > 10 and temp % 11 < 10:
			temp -= 10
			if positions[temp].is_x:
				res += 1
			else: break
		temp = index
		while temp < 110 and temp % 11 > 0:
			temp += 10
			if positions[temp].is_x:
				res += 1
			else: break
		if res >= 5: return true
		else: res = 1
		
	return false


func _on_Area2D_mouse_entered() -> void:
	if not selected: $mouse_over.show()


func _on_Area2D_mouse_exited() -> void:
	$mouse_over.hide()
	

func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and !selected:
		var positions = get_node("..").get_children()
		var index = positions.find(self)
		if global.turn and !get_node("..").get_parent().get_node("WIN").is_visible() and !get_node("..").get_parent().get_node("LOSE").is_visible():
			if get_tree().get_network_unique_id() == 1:
				rpc("xclick")
				if x_win(positions, index): 
					win()
					rpc("lose")
				
			else:
				rpc("oclick")
				if o_win(positions, index):
					win()
					rpc("lose")
			global.turn = false
			rpc("next")
			rset("selected", true)
