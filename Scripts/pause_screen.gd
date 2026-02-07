extends Control

@onready var exit_button: Button = $PausePanel/MarginContainer/VBoxContainer/EscButtonContainer/ExitButton
@onready var retry_button: Button = $PausePanel/MarginContainer/VBoxContainer/retryandmenuButtons/retryButton
@onready var main_menu_button: Button = $PausePanel/MarginContainer/VBoxContainer/retryandmenuButtons/mainMenuButton
@onready var settings_button: Button = $PausePanel/MarginContainer/VBoxContainer/settingsButton
@onready var game_manager: Node = %GameManager


@export var settingsPopup : PackedScene

signal panelClose

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("escape"):
		print("handled")
		get_viewport().set_input_as_handled()
		_on_exit_button_pressed()

func _on_exit_button_pressed() -> void:
	panelClose.emit()
	queue_free()

func _on_retry_button_pressed() -> void:
	pass # Replace with function body.

func _on_main_menu_button_pressed() -> void:
	pass

func _on_settings_button_pressed() -> void:
	var tempSettingsPopup = settingsPopup.instantiate()
	game_manager.ui.add_child(tempSettingsPopup)
