extends Label

func _ready() -> void:
	self.text = "O count: " + str(global.o_count)

func _process(delta: float) -> void:
	self.text = "O count: " + str(global.o_count)

