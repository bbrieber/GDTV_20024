@tool
class_name TileSpawner extends Node2D

@export var tile_prefab : PackedScene
var spawned_node = null

# Called when the node enters the scene tree for the first time.
func _ready()-> void :
	spawn_tile() # Replace with function body.

func spawn_tile()-> void :
	if spawned_node == null or not spawned_node.is_instance_valid(spawned_node):
		spawned_node = tile_prefab.instantiate()
		add_child(spawned_node)
	if spawned_node.has_method("init_tile"):
		spawned_node.init_tile()
	
