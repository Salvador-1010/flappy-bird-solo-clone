extends Control

@onready var exit_settings_button: Button = $Panel/MarginContainer/VBoxContainer/ExitSettingsContainer/ExitSettingsButton

#creates a null node to store the game manager 
#when the game manager instantiates the screen it will
#set itself as the node value
var game_manager : Node = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass 

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("escape"):
		if game_manager != null:
			game_manager.isSettingsopen = false
		queue_free()

func _on_exit_settings_button_pressed() -> void:
	if game_manager != null:
		game_manager.isSettingsopen = false
	queue_free()
