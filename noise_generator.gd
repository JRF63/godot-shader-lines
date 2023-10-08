extends TextureRect

func _ready():
	texture.noise = FastNoiseLite.new()
