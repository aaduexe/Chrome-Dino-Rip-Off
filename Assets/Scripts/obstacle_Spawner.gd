extends Node

var children = []
var targetObject = null
var target_x = null
var spawnDistant = 0
var is_spawnable = false

var obsSpawnPoint_x = 95.0
var obsSpawnPoint_y = -25

var obsInstance = [load("res://Assets/Scenes/spike0.tscn"),load("res://Assets/Scenes/spike1.tscn"), load("res://Assets/Scenes/spikeTrad.tscn")]
var obsIndex = 0

func spawnSpike():
	var newSpike = obsInstance[obsIndex].instantiate()
	newSpike.position = Vector2(obsSpawnPoint_x, obsSpawnPoint_y)
	add_child(newSpike)
	generateRandom_chooser()

func _ready():
	generateRandom_spawner()
	generateRandom_chooser()

func _process(delta):
	children = get_children()
	targetObject = children[children.size()-1]
	target_x = targetObject.position.x
	GameManager.speedIncreaser()
	
	
	if target_x < spawnDistant:
		if is_spawnable == true:
			spawnSpike()
			generateRandom_spawner()
			is_spawnable = false
		else:
			is_spawnable = true
	

func generateRandom_spawner():
	spawnDistant = randi_range(-50,60)

func generateRandom_chooser():
	obsIndex = randi_range(0,obsInstance.size()-1)
	






func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
