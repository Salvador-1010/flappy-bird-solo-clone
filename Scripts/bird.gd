extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0

@onready var death_collider: Area2D = $DeathCollider
@onready var death_audio: AudioStreamPlayer2D = $deathAudio
@onready var jump_audio: AudioStreamPlayer2D = $jumpAudio

#signal for bird to emit when it touches pipe
signal birdDied


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
		jump_audio.play()

	
	move_and_slide()

func _on_death_collider_area_entered(area: Area2D) -> void:
	if area.is_in_group("Pipes") or area.is_in_group("Floor"):
		death_audio.play()
		get_tree().paused = true


func _on_audio_stream_player_2d_finished() -> void:
	get_tree().paused = false
	birdDied.emit()
