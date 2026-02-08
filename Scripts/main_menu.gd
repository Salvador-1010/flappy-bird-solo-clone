extends Control

@onready var settings_button: Button = $PanelContainer/MarginContainer/MarginContainer/settingsButton

@export var settingsPopup : PackedScene
var started := false
signal mouseHovering

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("space") or event.is_action_pressed("mouse_left"):
		print("event")
		get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
func _input(event: InputEvent) -> void:
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_settings_button_pressed() -> void:
	var tempSettingsPopup = settingsPopup.instantiate()
	add_child(tempSettingsPopup)
