extends Node2D


@onready var MyPolygon: Polygon2D = $Polygon2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame
	get_window().transparent = true
	get_window().always_on_top = true
	get_window().mouse_passthrough = false
	get_window().mouse_passthrough_polygon = MyPolygon.polygon

# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	get_window().mouse_passthrough_polygon = MyPolygon.polygon
	if event is InputEventMouseButton:
		if event.pressed:
			print("hello")
func _input(event: InputEvent) -> void:
	pass
	#if event is InputEventMouseButton:
		#print("hello")
