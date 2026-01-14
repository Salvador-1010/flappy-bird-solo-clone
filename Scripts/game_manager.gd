extends Node

@onready var bird: CharacterBody2D = $"../Bird"
@onready var score_label: Label = %ScoreLabel
@onready var spawn_timer: Timer = $SpawnTimer
@export var pipe_pair_scene: PackedScene


var score := 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bird.birdDied.connect(_playerDied)
	spawn_timer.timeout.connect(_spawnPipe)
	_spawnPipe()

func _playerDied() -> void:
	get_tree().reload_current_scene()

func _addScore() -> void:
	score += 1
	score_label.text = "Score: " + str(score)
	
func _spawnPipe() -> void:
	var pipe_pair = pipe_pair_scene.instantiate()
	pipe_pair.difficulty = score
	add_child(pipe_pair) 
	pipe_pair.pointScored.connect(_addScore)
	print("pipeSpawned")
