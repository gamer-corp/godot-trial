extends Sprite2D

# variable to maintain the score
var score := [0, 0] 

# variable to maintain the paddle speed
const PADDLE_SPEED : int = 500

func _on_ball_timer_timeout():
	$Ball.new_ball() # Replace with function body.

func _on_score_cpu_body_entered(body):
	score[1] += 1
	$HUD/CPUScore.text = str(score[1])
	$BallTimer.start()

func _on_score_player_body_entered(body):
	score[0] += 1
	$HUD/PlayerScore.text = str(score[0])
	$BallTimer.start()


	
