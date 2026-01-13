extends Node2D

@onready var top_pipe: Area2D = $"Top Pipe"
@onready var score_line: Area2D = $"Score Line"
@onready var bottom_pipe: Area2D = $"Bottom Pipe"


#creates two separate distance varaibles so that the pipes
#can have uneeven 
var top_distance = randi_range(0,150)
var bottom_distance = randi_range(0, 150)
var top_pipe_height = 0
var bottom_pipe_height = 0

#variables to hodl the top and bottom pipe positions

var speed = 200

var difficulty := 0
#creates a signal to emit when it spawns
signal pointScored
#signal pipeOffScreen

#var to track total pipe gap distance
var total_gap := 0
#^^purpose is to ensure that the total distance
#between the pipes is always at least a specific amount 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score_line.body_entered.connect(_on_score_line_body_entered)
	top_pipe_height = top_pipe.get_node("CollisionShape2D").shape.size.y
	bottom_pipe_height = bottom_pipe.get_node("CollisionShape2D").shape.size.y
	gapRandomizer(difficulty)
	setPositions()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x += -speed * delta
	if global_position.x < -335: #335
		queue_free()
	
func setPositions() -> void:
	global_position.x = 600
	top_pipe.position.y = -top_distance - top_pipe_height/2
	bottom_pipe.position.y = bottom_distance + bottom_pipe_height/2
	
#generates the gap based on the score (changes difficulty)
func gapRandomizer(score: int) -> void:
	if score <= 10:
		top_distance = randi_range(115, 400)
		bottom_distance = randi_range(115, 340)
	elif score > 10 and score <= 25:
		top_distance = randi_range(95, 325)
		bottom_distance = randi_range(95, 285)
	elif score > 25 and score < 50:
		top_distance = randi_range(85, 265)
		bottom_distance = randi_range(85, 240)
	


func _on_score_line_body_entered(body: Node2D) -> void:
	if body.is_in_group("Bird_Character"):
		score_line.monitoring = false
		pointScored.emit()
