extends Camera2D
var isRunning := true

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	while isRunning:
		moveRight()

func moveRight() -> void:
	Camera2D.position.x += 1
