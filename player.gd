extends CharacterBody2D

@export var tool_scene: CustomizablePackedScene

@export_category("Movement variables")
@export var move_force = 450
@export var max_speed = 300
@export var friction = 5.6

func _ready():
	if tool_scene:
		print("Instaniating tool")
		var tool = tool_scene.instantiate()
		
		tool.position = Vector2()
		add_child(tool)

func _process(delta):
	var acceleration = Vector2()
	
	if Input.is_action_pressed("move_down"):
		acceleration.y += move_force
	if Input.is_action_pressed("move_up"):
		acceleration.y -= move_force
	if Input.is_action_pressed("move_left"):
		acceleration.x -= move_force
	if Input.is_action_pressed("move_right"):
		acceleration.x += move_force
	
	if acceleration == Vector2():
		velocity = lerp(velocity, Vector2(), friction * delta)
	else:
		velocity += acceleration * delta
		var magnitude = velocity.length()
		if magnitude > max_speed:
			velocity = (velocity / magnitude) * max_speed
	
	move_and_slide()
