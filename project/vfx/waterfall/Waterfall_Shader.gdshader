shader_type canvas_item;

uniform sampler2D border_texture  ;
uniform sampler2D mask_texture ;
uniform sampler2D wave_texture ;
uniform sampler2D v_noise_texture ;
uniform sampler2D h_noise_texture ;



void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	
	
	vec4 border = texture(border_texture,UV);
	vec4 wave = texture(wave_texture,UV + vec2(0.0, TIME));
	COLOR = border + wave;

}
