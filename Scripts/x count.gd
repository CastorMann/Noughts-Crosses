extends Label



func _ready() -> void:
	self.text = "X count: " + str(global.x_count)

func _process(delta: float) -> void:
	self.text = "X count: " + str(global.x_count)

