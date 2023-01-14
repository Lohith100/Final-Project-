extends KinematicBody

const maxspeed = 30
const accl = 0.75
var inputvector = Vector3()
var velo = Vector3()


func _physics_process(delta):
	inputvector.x = Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right")
	inputvector.y = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	inputvector = inputvector.normalized()
	velo.x = move_toward(velo.x, inputvector.x * maxspeed, accl)
	velo.y = move_toward(velo.y, inputvector.y * maxspeed, accl)
	rotation_degrees.z = velo.x * -2
	rotation_degrees.x = velo.y / 2
	rotation_degrees.y = -velo.x / 2
	move_and_slide(velo)
	transform.origin.x = clamp(transform.origin.x, -15.7, 15.7)
	transform.origin.y = clamp(transform.origin.y, -7.5, 8)


func _on_Area_body_entered(body):
	body = get_node("res://enemy.tscn")
	get_tree().reload_current_scene()

