shader_type canvas_item;
render_mode skip_vertex_transform;

uniform vec3 grid_color: source_color;
uniform float line_width_cs: hint_range(1.0, 100.0); // Anything below 1 pixel looks weird
uniform float cell_width_ws;

varying vec2 position_ws;
varying float line_width_ws;

void vertex() {
    VERTEX = (MODEL_MATRIX * vec4(VERTEX, 0.0, 1.0)).xy;
	position_ws = VERTEX.xy;
	
	// Width of 1.0 units in world space is `CANVAS_MATRIX[0][0]` units in canvas space
	line_width_ws = line_width_cs / CANVAS_MATRIX[0][0];
}

void fragment(){
	COLOR = vec4(0.0);
	if (abs(mod(position_ws.x, cell_width_ws)) <= line_width_ws
		|| abs(mod(position_ws.y, cell_width_ws)) <= line_width_ws) {
		COLOR = vec4(grid_color, 1.0);
	}
}
