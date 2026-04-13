extends Sprite2D

var speed = 200 #Pixeles
@onready var cannon:Sprite2D = $Cannon

var projectile_container:Node

func set_projectile_container(container:Node):
	cannon.projectile_container = container
	projectile_container = container
	
func _physics_process(delta):
	# Manera básica
	var direction:int = 0
	if Input.is_action_pressed("move_left"):
		direction = -1
	elif Input.is_action_pressed("move_right"):
		direction = 1
	
	#position.x += direction * speed * delta
	
	# Manera optimizada
	var direction_optimized:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	position.x += direction_optimized * speed * delta
	
	# Cannon rotation
	
	var mouse_position:Vector2 = get_global_mouse_position()
	cannon.look_at(mouse_position)
	
	# Fire cannon
	if Input.is_action_just_pressed("fire"):
		cannon.fire()
