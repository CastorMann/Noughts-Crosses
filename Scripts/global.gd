extends Node

var x_count = 0
var o_count = 0

remotesync var longest_x_line = 0
remotesync var longest_o_line = 0

var other_player_id = -1

var turn = false


func _on_Main_Menu_pressed() -> void:
	get_tree().change_scene("res://src/Main Menu.tscn")
