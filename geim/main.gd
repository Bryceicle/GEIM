extends Node2D

signal map_change

enum Map {
	BEACH,
	FISH_HOUSE
}

@export var current_map: Map = Map.FISH_HOUSE

const BEACH = preload("res://maps/beach.tscn")
const FISH_HOUSE = preload("res://maps/fisherman_house.tscn")

var camera_pos: Vector2

@onready var player: CharacterBody2D = $Fisherman
@onready var camera: Camera2D = $Camera
@onready var maps: Node2D = $Maps

# Will run our initial set up (into scene)
func _ready() -> void:
	load_map(Map.FISH_HOUSE, 1)

func load_map(get_map: Map, state: int = 0) -> void:
	
	# Unload other maps
	if maps.get_child_count() >2:
		maps.get_child(-1).free()
	
	# Load map and add it to scene tree.
	var map: Node2D
	match get_map:
		Map.BEACH:
			map = BEACH.instantiate()
		Map.FISH_HOUSE:
			map = FISH_HOUSE.instantiate()
	
	# Add map to scene tree
	maps.add_child(map)
	
	# Set current map
	current_map = get_map
	
	# Add set the player map, allowing direct acsess in player.gd 
	player.map = map
	
	# Spawn player at designated spawmning position
	player.position = map.get_spawn(state)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	camera_pos = camera.position
	pass
