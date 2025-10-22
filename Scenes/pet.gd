extends Node2D



@onready var pet: AnimatedSprite2D = $Pet



func _ready() -> void:
	var petScale = pet.scale
	petScale = Vector2(3,3)
	pet.scale = petScale
	get_window().size = Vector2i(pet.sprite_frames.get_frame_texture(pet.animation, 0).get_size()* petScale)
	var ScreenSize = DisplayServer.screen_get_size()
	var window_size = get_window().size
	get_window().position = ScreenSize - window_size - Vector2i(0,70) 

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			print("IT CLICKS")
