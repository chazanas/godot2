extends KinematicBody2D

# This is a demo showing how KinematicBody2D
# move_and_slide works.

# Member variables
const MOTION_SPEED = 300 # Pixels/second
const TILE_PORTAL = 1
var motionString = ""
var motionLast = Vector2(0,0)

func set_motion(inicio):
	move_and_slide(inicio.normalized() * MOTION_SPEED)
	motionLast = inicio.normalized() * MOTION_SPEED
		

func _physics_process(delta):
	var motion = Vector2()
	move_and_slide(motionLast)