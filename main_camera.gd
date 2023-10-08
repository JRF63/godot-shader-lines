extends Camera2D

@export var zoom_speed: float = 0.25
@export var zoom_duration: float = 0.2

@export var min_zoom: float = 0.5
@export var max_zoom: float = 200.0
@export var zoom_level: float = 10.0:
	get:
		return zoom_level
	set(value):
		zoom_level = clampf(value, min_zoom, max_zoom)
	
func _ready():
	zoom = Vector2(zoom_level, zoom_level)
		
func zoom_in(amount: float):
	zoom_level += amount * zoom_level
	var tween = get_tree().create_tween()
	tween.tween_property(self, "zoom", Vector2(zoom_level, zoom_level), zoom_duration)
	
func drag_camera(raw_delta: Vector2):
	var next_position = position + raw_delta * -2.0 / zoom_level
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", next_position, 0.1)
