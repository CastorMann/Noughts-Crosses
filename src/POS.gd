extends Area2D

var selected = false
var is_x = false
var is_o = false

func _ready() -> void:
	$mouse_over.hide()

func _on_POS_mouse_entered() -> void:
	if !selected:
		$mouse_over.show()

func _on_POS_mouse_exited() -> void:
	if !selected:
		$mouse_over.hide()
		
func get_position_type(pos):
	if pos.is_x: return "x"
	if pos.is_o: return "o"
	return null

	
func update_longest_line(pos) -> void:
	var parent = pos.get_parent()
	var children = parent.get_children()
	var type = get_position_type(pos)
	var index = children.find(pos)
	
	var res = 1
	var temp = index
	while temp % 11 > 0:
		temp -= 1
		if get_position_type(children[temp]) == type:
			res += 1
		else:
			break	
	temp = index
	while temp % 11 < 10:
		temp += 1
		if get_position_type(children[temp]) == type:
			res += 1
		else:
			break
	if type == "x":
		global.longest_x_line = max(global.longest_x_line, res)
	elif type == "o":
		global.longest_o_line = max(global.longest_o_line, res)
		
	
	res = 1
	temp = index
	while temp > 10:
		temp -= 11
		if get_position_type(children[temp]) == type:
			res += 1
		else:
			break		
	temp = index
	while temp < 110:
		temp += 11
		if get_position_type(children[temp]) == type:
			res += 1
		else:
			break
	if type == "x":
		global.longest_x_line = max(global.longest_x_line, res)
	elif type == "o":
		global.longest_o_line = max(global.longest_o_line, res)
	
	res = 1
	temp = index
	while temp > 10 and temp % 11 > 0:
		temp -= 12
		if get_position_type(children[temp]) == type:
			res += 1
		else:
			break		
	temp = index
	while temp < 110 and temp % 11 < 10:
		temp += 12
		if get_position_type(children[temp]) == type:
			res += 1
		else:
			break
	if type == "x":
		global.longest_x_line = max(global.longest_x_line, res)
	elif type == "o":
		global.longest_o_line = max(global.longest_o_line, res)
		
	
	res = 1
	temp = index
	while temp > 10 and temp % 11 < 10:
		temp -= 10
		if get_position_type(children[temp]) == type:
			res += 1
		else:
			break		
	temp = index
	while temp < 110 and temp % 11 > 0:
		temp += 10
		if get_position_type(children[temp]) == type:
			res += 1
		else:
			break
	if type == "x":
		global.longest_x_line = max(global.longest_x_line, res)
	elif type == "o":
		global.longest_o_line = max(global.longest_o_line, res)
		

func _on_POS_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and global.longest_o_line < 5 and global.longest_x_line < 5:
		if !selected and event.button_index == BUTTON_LEFT:
			if global.x_count <= global.o_count:
				$o.hide()
				$x.show()
				$mouse_over.hide()
				selected = true
				is_x = true
				is_o = false
				global.x_count += 1
			else:
				$x.hide()
				$o.show()
				$mouse_over.hide()
				selected = true
				is_o = true
				is_x = false
				global.o_count += 1
			update_longest_line(self)
			if global.longest_o_line == 5:
				get_parent().get_parent().get_parent().get_child(1).show()
			if global.longest_x_line == 5:
				get_parent().get_parent().get_parent().get_child(2).show()
		elif selected and event.button_index == BUTTON_RIGHT:
			$x.hide()
			$o.hide()
			selected = false
			if is_x:
				global.x_count -= 1
				is_x = false
			elif is_o:
				global.o_count -= 1
				is_o = false
