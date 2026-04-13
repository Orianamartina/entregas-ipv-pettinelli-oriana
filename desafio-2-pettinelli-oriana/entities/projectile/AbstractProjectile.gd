extends Sprite2D
class_name Projectile

signal delete_requested(projectile)

@export var speed:float
var direction:Vector2

func _ready() -> void:
	set_physics_process(false)
	speed = 400
	
func set_starting_values(starting_position:Vector2, direction:Vector2):
	global_position = starting_position
	self.direction = direction
	$Timer.start()
	set_physics_process(true)
	
func _physics_process(delta: float) -> void:
	position += direction * speed * delta

	var screen_pos = get_viewport().get_canvas_transform() * global_position
	var visible_rect = get_viewport().get_visible_rect()
	if !visible_rect.has_point(screen_pos):
		emit_signal("delete_requested", self)
		set_physics_process(false)


func _on_timer_timeout() -> void:
	emit_signal("delete_requested", self)
