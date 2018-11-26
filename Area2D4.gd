extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if get_overlapping_bodies().size() == 1 :
		print('hit!!!')
		get_tree().change_scene("res://winScene.tscn")
	#else:
		#print('not_hit!')
