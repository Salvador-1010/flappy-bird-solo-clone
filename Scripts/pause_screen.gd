extends Control

@onready var exit_button: Button = $PausePanel/MarginContainer/VBoxContainer/EscButtonContainer/ExitButton

signal panelClose

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("escape"):
		print("s esc")
		_on_exit_button_pressed()

func _on_exit_button_pressed() -> void:
	panelClose.emit()
	queue_free()
