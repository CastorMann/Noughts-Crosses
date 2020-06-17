extends Label


func _ready() -> void:
	self.text = "Longest X line: " + str(global.longest_x_line)

func _process(delta: float) -> void:
	self.text = "Longest X line: " + str(global.longest_x_line)

