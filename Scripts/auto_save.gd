extends Node

const save_path := "user://save.json"

#premade dictionary to store all of the data that will be kept longterm
var data_to_save := {
	"High_Score" : 0,
	"MasterVolume" : 0.0,
	"SFXVolume" : 0.0,
	"MusicVolume" : 0.0
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#checks to see if the file exist and if not it will run _save() to create a new one
	if FileAccess.file_exists(save_path):
		_load()
	else:
		_save()


func _load() -> void:
	var save_file = FileAccess.open(save_path, FileAccess.READ)
	var data : Dictionary = save_file.get_var()
	save_file.close()
	
	#creates a duplicate of all the data and then writes it to the dictionary to store
	var saved_data = data.duplicate()
	#code to individually add over new data to premade default dictionary
	var dataDup = data_to_save.duplicate() 
	for key in dataDup:
		if saved_data.has(key):
			dataDup[key] = saved_data[key]
			
	data_to_save = dataDup
	
	#code to apply all of the saved data to beginning of game run
		
func _save() -> void:
	var save_file = FileAccess.open(save_path, FileAccess.WRITE)
	save_file.store_var(data_to_save.duplicate())
	save_file.close()
	

#code to implement setter functions for better scalability 
