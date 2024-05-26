class_name Player extends CharacterBody2D


@onready var player_skin: PlayerSkin= $PlayerSkin

@onready var input_processor: InputProcessor = $Managers/InputProcessor
@onready var player_state: PlayerState = $Managers/PlayerState


@export var player_movement_config : PlayerMovementConfig
@export var initial_energy : Energy

signal respawn


func _ready()->void:
	AlEnergySystem.initialize(initial_energy)
	pass

func on_hit()->void:
	player_state.kill_player()

