extends Node

@onready var bird: CharacterBody2D = $"../Bird"
@onready var score_label: Label = %ScoreLabel
@onready var spawn_timer: Timer = $SpawnTimer
@export var pipe_pair_scene: PackedScene
@onready var death_screen: PanelContainer = $"../UI/DeathScreenControl/DeathScreen"
@onready var finalScore: Label = $"../UI/DeathScreenControl/DeathScreen/MarginContainer/VBoxContainer/Score"


var score := 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	bird.birdDied.connect(_playerDied)
	spawn_timer.timeout.connect(_spawnPipe)
	_spawnPipe()

func _playerDied() -> void:
	death_screen.visible = true
	finalScore.text = "Score: " + str(score)
	get_tree().paused = true
	#get_tree().reload_current_scene()

func _addScore() -> void:
	score += 1
	score_label.text = "Score: " + str(score)
	
func _spawnPipe() -> void:
	var pipe_pair = pipe_pair_scene.instantiate()
	pipe_pair.difficulty = score
	add_child(pipe_pair) 
	pipe_pair.pointScored.connect(_addScore)
	print("pipeSpawned")



func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_menu_button_pressed() -> void:
	#get_tree().reload_current_scene()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
