extends StaticBody2D

# variable to maintain the window height
var window_height : int
var window_width : int

# variable to maintain the paddle height 
var paddle_height : int
var paddle_width : int

# Called when the node enters the scene tree for the first time.
func _ready():
	window_height = get_viewport_rect().size.y
	window_width = get_viewport_rect().size.x

	paddle_height = $Sprite2D.get_rect().size.y
	paddle_width = $Sprite2D.get_rect().size.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# based on user action move the paddle
	if Input.is_action_pressed("move_up"):
		position.y -= get_parent().PADDLE_SPEED * delta
	elif Input.is_action_pressed("move_down"):
		position.y += get_parent().PADDLE_SPEED * delta

	position.y = clamp(position.y, paddle_height/2, (window_height - (paddle_height / 2)))
	


