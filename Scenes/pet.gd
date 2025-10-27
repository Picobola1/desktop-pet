extends Node2D



@onready var pet: AnimatedSprite2D = $Pet



func _ready() -> void:
	var petScale = pet.scale

	petScale = Vector2(2,2)
	pet.scale = petScale
	get_window().size = Vector2i(pet.sprite_frames.get_frame_texture(pet.animation, 0).get_size()* petScale)
	var ScreenSize = DisplayServer.screen_get_size()
	var window_size = get_window().size
	get_window().position = ScreenSize - window_size - Vector2i(0,70) 

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			
			var randNum = 3#randi_range(1,5)
			if randNum == 1:
				await ToEdge(350,true,true)
				await ToEdge(350,true,false)
				pet.flip_h = false
				pet.play("idle")
			if randNum == 2:
				MakeWindow("res://Scenes/food.tscn", Vector2i(randi_range(1,800), randi_range(1,800)), Vector2i(50,50))
			if randNum == 3:
				MakeWindow("res://Scenes/speech_bubble.tscn", Vector2i(get_window().position) + Vector2i(-70,5), Vector2i(105,100))
				
			if randNum == 4:
				print("4")
			if randNum == 5:
				print("5")
func ToEdge(range: int,direction: bool,move: bool):
	if move == true:
		for i in range(range):
			if direction == false:
				get_window().position += Vector2i(5,0)
			else:
				get_window().position += Vector2i(-5,0)
			await get_tree().process_frame
			pet.play("walk")
func MakeWindow(scene_path, pos: Vector2i, size: Vector2i):

	var window = Window.new()
	window.title = "Pumpkin Time!"
	
	window.size = size
	window.position = pos
	window.unresizable = true
	window.always_on_top = true
	window.visible = false  # important: hide until scene is ready
	window.process_mode = Node.PROCESS_MODE_ALWAYS  # keep running even if unfocused
	window.transparent = true
	window.borderless = true
	
	


	get_tree().root.add_child(window)

	var scene = load(scene_path).instantiate()
	window.add_child(scene)
	await get_tree().process_frame  # wait one frame so it's ready
	window.visible = true
	
	return scene
