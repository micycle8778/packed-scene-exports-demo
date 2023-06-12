extends Node2D

@export var rotation_speed := 45

var message = "Hello, world!"

func _ready():
	print(message)

func _process(delta):
	rotation_degrees += rotation_speed * delta
