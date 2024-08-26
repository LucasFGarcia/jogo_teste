extends CharacterBody2D

const SPEED = 450.0 #velocidade do personagem
const JUMP_VELOCITY = -600.0 #velocidade do pulo
var estaPulando = false
var life = 3
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 1500
signal morri

func _physics_process(delta): #processo da física
	# Add the gravity.
	if not is_on_floor(): #se não tiver no chão vai fazer a conta da gravidade * delta
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor(): #se tiver precissionado irá executar o pulo 
		velocity.y = JUMP_VELOCITY
		estaPulando = true
	elif is_on_floor():
		estaPulando = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right") #mover esquerda para direita
	if direction: 
		velocity.x = direction * SPEED
		$AnimatedSprite2D.scale.x= direction * 3
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED) #mover para outra direção

#animacao
	if is_on_floor():
		if estaPulando:
			$AnimatedSprite2D.play("jump")
		elif direction != 0: 
			$AnimatedSprite2D.play("run")
		elif direction == 0: 
			$AnimatedSprite2D.play("idle")
	else: #se não no chão
		if velocity.y < 0:
			$AnimatedSprite2D.play("jump")
		else: 
			$AnimatedSprite2D.play("fall")
					
		
		

	move_and_slide() #mover o objeto

func _levoudano():
	life -=1
	print("morri")
	#if life ==0:
	emit_signal("morri")




