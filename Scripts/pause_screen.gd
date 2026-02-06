extends Control

@onready var exit_button: Button = $PausePanel/MarginContainer/VBoxContainer/EscButtonContainer/ExitButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	pass

func _on_exit_button_pressed() -> void:
	queue_free()
	exit_pause()

func exit_pause() -> void:
	get_tree().paused = false
