extends Node2D


func _on_winmenu_pressed() -> void:
	hide()
	for pos in $OPOS.get_children():
		pos.hide()
	get_tree().set_network_peer(null)
	get_tree().change_scene("res://src/Main Menu.tscn")


func _on_losemenu_pressed() -> void:
	hide()
	for pos in $OPOS.get_children():
		pos.hide()
	get_tree().set_network_peer(null)
	get_tree().change_scene("res://src/Main Menu.tscn")
