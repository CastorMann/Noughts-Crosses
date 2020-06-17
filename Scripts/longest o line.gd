extends Label


func _ready() -> void:
	self.text = "Longest O line: " + str(global.longest_o_line)

func _process(delta: float) -> void:
	self.text = "Longest O line: " + str(global.longest_o_line)
