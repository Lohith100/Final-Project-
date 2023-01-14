extends Spatial
var score 
var time = 0

func _physics_process(delta: float) -> void:
	time += delta * 4
	score = "%010d"%[time]
	$score.text = score
	



func _on_Area_body_entered(body):
	body = get_node("res://enemy.tscn")
	get_tree().reload_current_scene()
