extends Control


func _on_New_Game_pressed() -> void:
	
	POS_ARRAY.update_children()
	for i in POS_ARRAY.positions:
		i.selected = false
		i.is_x = false
		i.is_o = false
	global.x_count = 0
	global.o_count = 0
	global.longest_o_line = 0
	global.longest_x_line = 0
	get_tree().change_scene("res://src/Game Scene.tscn")


func _on_Online_pressed() -> void:
	get_tree().change_scene("res://src/Online Menu.tscn")
