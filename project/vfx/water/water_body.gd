extends Area2D



@export var k: float = 0.015
@export var dampening: float = 0.03
@export var spread: float = 0.0002

@export var passes: int = 8

@export var distance_between_springs: int = 8
var spring_number: int = 6

@onready var water_spring_scene = preload("res://vfx/water/water_spring.tscn") 

@onready var water_polygon :Polygon2D = %WaterPolygon
@onready var water_border :SmoothPath = %WaterBorder
@export  var color : Color = Color(1,1,1,1)
@export var border_thickness = 0.5

@export var collision_shape: CollisionShape2D 

var depth:int


var target_height:float 
var bottom:float 

var springs :Array=[]


func _ready()->void:
	water_border.width = border_thickness
	water_border.color = color
	
	
	var rect :Rect2 = collision_shape.shape.get_rect()
	print(rect.size)
	print(rect.position)
	depth = rect.size.y
	target_height = rect.position.y +collision_shape.position.y 
	bottom = target_height + depth
	
	spring_number = rect.size.x /distance_between_springs + 1
	
	for i in range(spring_number):
		var x_position =  rect.position.x +collision_shape.position.x + distance_between_springs * i
		var w :WaterSpring= water_spring_scene.instantiate()
		add_child(w)
		springs.append(		w)
		w.initialize(x_position,distance_between_springs,i)
		w.splash.connect(splash)
			
	#splash(2,5)
func _process(_delta:float)->void:
	new_border()
	draw_water_body()

func _physics_process(_delta:float) -> void :
	var left_deltas = []
	var right_deltas = []
	
	for spring in springs:
		spring.spring_update(k,dampening)
		left_deltas.append(0)	
		right_deltas.append(0)	
	for p :int in range(passes):
		for i in range(springs.size()):
			
			
			if i > 0:
				left_deltas[i] = spread * (springs[i].height -springs[i-1].height )
				springs[i-1].velocity +=left_deltas[i]
			if i < springs.size() -1:
				right_deltas[i] = spread * (springs[i].height -springs[i+1].height )
				springs[i+1].velocity +=right_deltas[i]

	springs[0].velocity = 0
	springs[springs.size() -1].velocity = 0

func splash(index:int,speed:float)->void:
	if index<0 or index >springs.size():
		return
	
	springs[index].velocity +=speed	
	
	
func draw_water_body()->void:
	var points = []
	
	for s in springs:
		points.append(s.position)

	#var curve = water_border.curve
	#var points = Array(curve.get_baked_points())
	
		
	var last_index = springs.size() -1
	
	var water_polygon_points = points
	
	water_polygon_points.append(Vector2(points[last_index].x,bottom))
	water_polygon_points.append(Vector2(points[0].x,bottom))
		
	var water_polygon_points_array : PackedVector2Array = PackedVector2Array(water_polygon_points)
	water_polygon.polygon = water_polygon_points_array

func new_border():
#	var curve :Curve2D = Curve2D.new().duplicate()
	var curve :Curve2D = Curve2D.new().duplicate()
	
	var surface_points = []
	for spring in springs:
		surface_points.append(	spring.position)
		curve.add_point(spring.position)
	
	water_border.curve =  curve
	
	water_border.smooth(true)
	water_border.queue_redraw()
