extends Sprite2D

@export var grid_color: Color = Color.BLACK
@export var line_width: float = 1.0
@export var cell_width: float = 250.0

func _ready():
	material.set_shader_parameter("grid_color", grid_color)
	material.set_shader_parameter("line_width_cs", line_width)
	material.set_shader_parameter("cell_width_ws", cell_width)
