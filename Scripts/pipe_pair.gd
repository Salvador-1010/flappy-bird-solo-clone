extends Node2D

@onready var top_pipe: Area2D = $"Top Pipe"
@onready var score_line: Area2D = $"Score Line"
@onready var bottom_pipe: Area2D = $"Bottom Pipe"

var gap_height = randi_range(0,150)
var half_top_pipe_height = 0
var half_bottom_pipe_height = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	half_top_pipe_height = top_pipe.get_node("CollisionShape2D").shape.size.y /2
	half_bottom_pipe_height = bottom_pipe.get_node("CollisionShape2D").shape.size.y /2
	top_pipe.position.y = gap_height/2 + half_top_pipe_height
	bottom_pipe.position.y = gap_height/2 + half_bottom_pipe_height


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	gap_height = randi_range(25, 500)
	print(gap_height)
	top_pipe.position.y = -gap_height/2 - half_top_pipe_height
	bottom_pipe.position.y = gap_height/2 + half_bottom_pipe_height

	
