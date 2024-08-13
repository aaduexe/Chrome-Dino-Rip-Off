extends Node

var children = []
var targetObject = null
var target_x = null
var spawnDistant = 0
var is_spawnable = false

var obsSpawnPoint_x = 95.0
var obsSpawnPoint_y = -25

var obsInstance = load("res://Assets/Scenes/spike0.tscn")

func spawnSpike():
	var newSpike = obsInstance.instantiate()
	newSpike.position = Vector2(obsSpawnPoint_x, obsSpawnPoint_y)
	add_child(newSpike)

func _ready():
	generateRandom()

func _process(delta):
	children = get_children()
	targetObject = children[children.size()-1]
	target_x = targetObject.position.x
	
	
	if target_x < spawnDistant:
		if is_spawnable == true:
			spawnSpike()
			generateRandom()
			is_spawnable = false
		else:
			is_spawnable = true
	
	print(spawnDistant)
	print(children)
	print(targetObject)

func generateRandom():
	spawnDistant = randi_range(-50,60)
