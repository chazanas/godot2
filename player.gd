extends KinematicBody2D

# This is a demo showing how KinematicBody2D
# move_and_slide works.

# Member variables
const MOTION_SPEED = 600 # Pixels/second
const TILE_PORTAL = 1
var motionString = ""


func _physics_process(delta):
	var motion = Vector2()	
	if get_slide_count() > 0 || motionString == "":
		if Input.is_action_pressed("move_up"):					
			motionString = "move_up"
		if Input.is_action_pressed("move_bottom"):
			motionString = "move_bottom"
		if Input.is_action_pressed("move_left"):
			motionString = "move_left"
		if Input.is_action_pressed("move_right"):
			motionString = "move_right"
		if Input.is_action_just_pressed("reset"):
			motionString = ""
			get_tree().change_scene(get_tree().get_current_scene().filename)
			
	
	if motionString == "move_up":
		motion += Vector2(0, -1)
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.play()		
	if motionString == "move_bottom":		
		motion += Vector2(0, 1)
		$AnimatedSprite.animation = "down"
		$AnimatedSprite.play()
	if motionString == "move_left":
		motion += Vector2(-1, 0)
		$AnimatedSprite.animation = "left"
		$AnimatedSprite.play()
	if motionString == "move_right":
		motion += Vector2(1, 0)
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.play()
	
	if self.is_on_wall():
		$AnimatedSprite.stop()
	
	motion = motion.normalized() * MOTION_SPEED	
	
	move_and_slide(motion)
	if get_slide_count() > 0: 
		for i in range(get_slide_count()):
			var coll_pos = get_slide_collision(i).collider
			if coll_pos == get_parent().get_node("caixa"):
				var box = coll_pos
				box.set_motion(motion)
				motionString = ""
			if coll_pos == get_parent().get_node("caixa2"):
				var box = coll_pos
				box.set_motion(motion)
				motionString = ""
			if coll_pos == get_parent().get_node("caixa3"):
				var box = coll_pos
				box.set_motion(motion)
				motionString = ""
			##var collidingWith = get_collision_pos()
			##print("hit1")
			
			
			
			#print(tile);
			#if tile == TILE_PORTAL:
				#print("hit")