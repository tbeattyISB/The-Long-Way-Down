extends KinematicBody2D

var powerupCount:int = 0
export var gravity:float = 5
export var speed:float
var vel:Vector2

func _physics_process(delta):
	vel.x=vel.x/speed
	if Input.is_action_pressed("ui_left"):
		vel.x-=speed
	elif Input.is_action_pressed("ui_right"):
		vel.x+=speed
	elif Input.is_action_just_pressed("ui_down"):
		if powerupCount>0:
			powerupCount-=1
			vel.y+=1000
	
	vel.y+=gravity-0.0001*vel.y*vel.y
	
	move_and_slide(vel, Vector2.UP)
	
	if is_on_floor():
		print(vel.y)
		if vel.y >= 600:
			for i in self.get_slide_count():
				var collider=self.get_slide_collision(i).collider
				if collider.is_in_group("breakable"):
					collider.queue_free()
	if self.position.y >2000:
		get_tree().reload_current_scene()
		self.position.y=50
			
func _on_dash_body_entered(body):
	powerupCount+=1
