extends CharacterBody2D

const START_SPEED : int = 300.0
const ACL : int = 50
const MAX_Y_VECTOR : float = 0.6

var current_speed : int
var window_size : Vector2
var direction : Vector2

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	window_size = get_viewport_rect().size

# Initialize the ball position and speed at begining and after every point.
func new_ball():
	position.x = window_size.x / 2
	position.y = randi_range(200, window_size.y - 200)
	current_speed = START_SPEED
	
	direction = random_direction()

func random_direction():
	var new_direction := Vector2()
	new_direction.x = [1, -1].pick_random()
	new_direction.y = randf_range(-1, 1)
	return new_direction.normalized()
	
func _physics_process(delta):
	var collision = move_and_collide(direction * current_speed * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		if collider == $"../PlayerPaddle" or collider == $"../CPUPaddle":
			current_speed += ACL
			direction = new_direction(collider)
		else:
			direction = direction.bounce(collision.get_normal())
			
func new_direction(collider):
	var ball_y = position.y
	var paddle_y = collider.position.y
	var distance = ball_y - paddle_y
	var new_dir := Vector2()
	
	if direction.x > 0:
		new_dir.x = -1
	else:
		new_dir.x = 1
	
	new_dir.y = (distance / (collider.position.y / 2)) * MAX_Y_VECTOR
	return new_dir.normalized()
