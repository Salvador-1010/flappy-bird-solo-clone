extends Node2D

var gapHeight = 0
var gapCenterY = 0

@onready var score_line: Area2D = $"Score Line"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gapHeight = clamp(randi(), 10, 100)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
