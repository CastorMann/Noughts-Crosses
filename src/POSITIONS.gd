extends Node


var positions = []
var count = self.get_child_count()
func update_children() -> void:
	positions = []
	for i in self.get_children():
		positions.append(i)

func _ready() -> void:
	update_children()
