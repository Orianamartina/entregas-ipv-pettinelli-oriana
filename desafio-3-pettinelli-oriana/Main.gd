extends Node

@onready var player: Node2D = $Player

func _ready() -> void:
	randomize()
	player.initialize(self)
	$Turrets/Turret.initialize(self)
	$Turrets/Turret2.initialize(self)
	$Turrets/Turret3.initialize(self)
	$Turrets/Turret4.initialize(self)
