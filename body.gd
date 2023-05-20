extends Sprite2D

@export var sprite1: CompressedTexture2D = null
@export var sprite2: CompressedTexture2D = null

# Called when the node enters the scene tree for the first time.
func _ready():
	var sprites = [sprite1, sprite2]
	texture = sprites[randi() % sprites.size()]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
