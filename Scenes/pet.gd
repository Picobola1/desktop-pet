extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_window().mouse_passthrough = false
	#get_window().mouse_passthrough_polygon = $Polygon2D.polygon
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		print("hello")
