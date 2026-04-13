extends Sprite2D
class_name Turret
@onready var fire_position: Node2D = $FirePosition
@onready var fire_timer: Timer = $FireTimer
@onready var raycast: RayCast2D = $RayCast2D

@export var projectile_scene: PackedScene

var projectile_container: Node

var target: Node2D

func _ready():
	fire_timer.connect("timeout", Callable(self, "fire_at_player"))

func initialize(projectile_container: Node) -> void:
	self.projectile_container = projectile_container

func fire_at_player() -> void:
	if can_see_player():
		var proj_instance = projectile_scene.instantiate()
		proj_instance.initialize(
			projectile_container,
			fire_position.global_position,
			fire_position.global_position.direction_to(target.global_position)
		)  

func can_see_player() -> bool:
	if target == null:
		return false
	
	raycast.target_position = raycast.to_local(target.global_position)
	raycast.force_raycast_update()
	
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		return collider == target
	
	return false
	
func take_damage() -> void:
	queue_free()

func _on_detection_area_body_entered(body: Node2D) -> void:
	if target == null && body.name == "Player":
		target = body
		fire_timer.start()


func _on_detection_area_body_exited(body: Node2D) -> void:
	if body == target:
		target = null
		fire_timer.stop()
