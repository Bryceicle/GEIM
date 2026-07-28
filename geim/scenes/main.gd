extends Node2D

signal map_change

enum Map {
	BEACH,
	FISH_HOUSE
}

const BEACH = preload("res://scenes/maps/beach.tscn")
const FISH_HOUSE = preload("res://scenes/maps/fisherman_house.tscn")

@onready var player: CharacterBody2D = $Fisherman
@onready var maps: Node2D = $Maps

# Will run our initial set up (into scene)
func _ready() -> void:
	load_map(1, 1)

func load_map(get_map: Map, state: int = 0) -> void:
	
	# Unload other maps
	for child in maps.get_children():
		child.queue_free()
	
	# Load map and add it to scene tree.
	var map: Node2D
	match get_map:
		Map.BEACH:
			map = BEACH.instantiate()
		Map.FISH_HOUSE:
			map = FISH_HOUSE.instantiate()
	
	# Add map to scene tree
	maps.add_child(map)
	
	# Add set the player map, allowing direct acsess in player.gd 
	player.map = map
	
	# Spawn player at designated spawmning position
	player.position = map.get_spawn(state)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
