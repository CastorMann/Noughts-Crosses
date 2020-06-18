extends Control

func _ready() -> void:
	get_tree().connect("network_peer_connected", self, "_player_connected")


func _player_connected(id):
	print("Player Connected")
	global.other_player_id = id
	var game = preload("res://src/Online Game Scene.tscn").instance()
	get_tree().get_root().add_child(game)
	game.set_network_master(id)
	if id == 1:
		global.turn = true
	hide()

func _on_Main_Menu_pressed() -> void:
	get_tree().change_scene("res://src/Main Menu.tscn")


func _on_Host_Game_pressed() -> void:
	print("Hosting new game")
	var host = NetworkedMultiplayerENet.new()
	var res = host.create_server(1000, 2)
	if res != OK:
		print("Error creating server")
		return
	get_tree().set_network_peer(host)
	


func _on_Join_Game_pressed() -> void:
	print("Joining game")
	var host = NetworkedMultiplayerENet.new()
	host.create_client("127.0.0.1", 1000)
	get_tree().set_network_peer(host)
	
