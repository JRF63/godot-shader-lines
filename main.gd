extends Node2D

var mouse_is_being_pressed: bool = false

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("zoom_in"):
		$MainCamera.zoom_in($MainCamera.zoom_speed)
	if event.is_action_pressed("zoom_out"):
		$MainCamera.zoom_in(-$MainCamera.zoom_speed)
	if event is InputEventMouseButton:
		mouse_is_being_pressed = event.pressed
	if event is InputEventMouseMotion:
		if mouse_is_being_pressed:
			$MainCamera.drag_camera(event.relative)
