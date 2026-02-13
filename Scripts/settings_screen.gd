extends Control

@onready var exit_settings_button: Button = $Panel/MarginContainer/VBoxContainer/ExitSettingsContainer/ExitSettingsButton

#variables to call to each slider respectively 
@onready var master_slider: HSlider = $"Panel/MarginContainer/VBoxContainer/SliderMargains/Slider Containers/MasterVolumeSlider/MasterSlider"
@onready var sfx_slider: HSlider = $"Panel/MarginContainer/VBoxContainer/SliderMargains/Slider Containers/SFXVolumeSlider/SFXSlider"
@onready var music_slider: HSlider = $"Panel/MarginContainer/VBoxContainer/SliderMargains/Slider Containers/MusicVolumeSlider/MusicSlider"

@onready var cancel_button: Button = $Panel/MarginContainer/VBoxContainer/HBoxContainer/CancelButton
@onready var apply_button: Button = $Panel/MarginContainer/VBoxContainer/HBoxContainer/ApplyButton

#creates a null node to store the game manager 
#when the game manager instantiates the screen it will
#set itself as the node value
var game_manager : Node = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#makes the sliders appear at the value of the current sound 
	#BUT first must convert from dB to float duhh
	#also dont forget the "-1" to counteract the skewer used earlier 
	master_slider.set_value_no_signal(db_to_linear(AutoSave.data_to_save["MasterVolume"]) - 1)
	sfx_slider.set_value_no_signal(db_to_linear(AutoSave.data_to_save["SFXVolume"]) - 1)
	music_slider.set_value_no_signal(db_to_linear(AutoSave.data_to_save["MusicVolume"]) - 1)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("escape"):
		if game_manager != null:
			game_manager.isSettingsopen = false
		queue_free()

func _on_exit_settings_button_pressed() -> void:
	if game_manager != null:
		game_manager.isSettingsopen = false
	queue_free()

#all these functions do is show the buttons and the change wont be applied until the apply button is pressed
func _on_master_slider_drag_ended(value_changed: bool) -> void:
	_showButtons()

func _on_sfx_slider_drag_ended(value_changed: bool) -> void:
	_showButtons()

func _on_music_slider_drag_ended(value_changed: bool) -> void:
	_showButtons()

#function to enable the cancel and apply button visibility only when any settings are changed
func _showButtons() -> void:
	cancel_button.visible = true
	apply_button.visible = true

func _hideButtons() -> void:
	cancel_button.visible = false
	apply_button.visible = false

#when the cancel button is pressed it will reset the sliders to the last saved value and then hide the 
#cancel and apply buttons again
func _on_cancel_button_pressed() -> void:
	_hideButtons()
	master_slider.value = (db_to_linear(AutoSave.data_to_save["MasterVolume"]) - 1)
	music_slider.value = db_to_linear(AutoSave.data_to_save["MusicVolume"]) - 1
	sfx_slider.value = db_to_linear(AutoSave.data_to_save["SFXVolume"]) - 1

#applies all of the audio changes made with the sliders when pressed
func _on_apply_button_pressed() -> void:
	#adds a 1 to the value in order to skew the slider and allow for volume up AND down boom 
	AutoSave._setMusicVolume(music_slider.value + 1.0)
	AutoSave._setSFXVolume(sfx_slider.value + 1.0)
	AutoSave._setMasterVolume(master_slider.value + 1.0)
	_hideButtons()
	
