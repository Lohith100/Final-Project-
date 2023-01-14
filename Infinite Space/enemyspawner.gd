extends Spatial

onready var main = get_tree().current_scene
var Enemy = load("res://assets/Striker.tscn")
var Rocks = load("res://sun.tscn")

func _spawn():
	var enemy = Enemy.instance()
	var rocks = Rocks.instance()
	main.add_child(rocks)
	main.add_child(enemy)
	enemy.transform.origin = transform.origin + Vector3(rand_range(-5,5),rand_range(-7.5,8),0)
	rocks.transform.origin = transform.origin + Vector3(rand_range(-15,15),rand_range(-5,5),0)




func _on_Timer_timeout():
	_spawn()




