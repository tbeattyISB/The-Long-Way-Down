extends KinematicBody2D

export var gravity: float = 5
export var speed: float
var vel: Vector2
signal die

func _physics_process(delta):
	vel.x=0
	if Input.is_action_pressed("ui_left"):
		vel.x-=speed
	elif Input.is_action_pressed("ui_right"):
		vel.x+=speed
	if Input.is_action_pressed("ui_down"):
		vel.y+=20
	
	vel.y+=gravity-0.00001*vel.y*vel.y
	
	move_and_slide(vel, Vector2.UP)
	
	if is_on_floor():
		if vel.y > 0:
			for i in self.get_slide_count():
				var collider = self.get_slide_collision(i).collider
				print(collider)
				if collider.is_in_group("breakable"):
					collider.queue_free()
		emit_signal("die")
#		queue_free()
	if self.position.y > 2500:
		get_tree().reload_current_scene()
		

