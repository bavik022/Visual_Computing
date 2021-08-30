#version 330

#define PI 3.14159265

uniform sampler2D tex;           // The height field, which contains the height in meters (float) for each point. 
uniform ivec2     texSize;       // The width and height of the field.
uniform float     hMin;          // Minimum height that occurs in the texture.
uniform float     hMax;          // Maximum height that occurs in the texture.
uniform float     lengthScale;   // Length of a single pixel in meters.
uniform int       filter;        // Rendering mode (gray = 0, normal = 1, etc.)
uniform vec3      lightDir;      // The direction of the incident light.

layout(location = 0) out vec4 fragColor;

in vec2 texCoords;

/**
 *  Fetches the height at a point.
 */
float fetch(ivec2 tc) {
	return texelFetch(tex, tc, 0).r;
}


vec3 normal( ivec2 tc ) {
	vec3 n = vec3(0.0, 0.0, 0.0);
	// TODO
    ivec2 x_p = ivec2(tc.x+1,tc.y);
	ivec2 x_n = ivec2(tc.x-1,tc.y);
	ivec2 y_p = ivec2(tc.x,tc.y+1);
	ivec2 y_n = ivec2(tc.x,tc.y-1);
	
	float tx = float(fetch(x_p)-fetch(x_n))/(2.0*lengthScale);
	float ty = float(fetch(y_p)-fetch(y_n))/(2.0*lengthScale);
	
	//defining the tangent vectors
	vec3 tangent_x = vec3(1,  0,  tx); 
	vec3 tangent_y = vec3(0, 1,  ty); 

	float mag = sqrt(tx*tx + ty*ty + 1);
	//calculating the normal using the cross-product
	n = vec3(-tx/mag,-ty/mag,1.0/mag); 

	return n;
}


float reliefVal( ivec2 tc ) {
	float val = 0.0;
	
	// TODO
	vec3 n=normal(tc);
	float mag = sqrt(lightDir.x*lightDir.x + lightDir.y*lightDir.y + lightDir.z*lightDir.z);
	// Dot-product of normal with light direction(normalized)
	val=((-lightDir.x/mag)*n.x+(-lightDir.y/mag)*n.y+(-lightDir.z/mag)*n.z);
	return val;
}

vec2 principalCurvature(ivec2 tc) {
	vec2 pcurv = vec2(0.0);
	// TODO
    ivec2 p = ivec2(tc.x,tc.y);
	// Positions
	ivec2 x_p = ivec2(tc.x+1,tc.y); //x-positive
	ivec2 x_n = ivec2(tc.x-1,tc.y); //x-negative
	ivec2 y_p = ivec2(tc.x,tc.y+1); //y-positive
	ivec2 y_n = ivec2(tc.x,tc.y-1); //y-negative

	float fxx = float(fetch(x_p)-2*fetch(p)+fetch(x_n))/(lengthScale*lengthScale);
	float fyy = float(fetch(y_p)-2*fetch(p)+fetch(y_n))/(lengthScale*lengthScale);
	//trace = sum of diagonal elements = (fxx+fyy)
    pcurv  = vec2((fxx+fyy)/2.0);

	return pcurv;
}

void main() {
    vec4 color = vec4(0.1, 0.1, 0.1, 1);
    ivec2 tc = ivec2(texCoords*texSize);  // Integer (pixel) texture coordinates.
    
    float h = (texture2D(tex,texCoords).r - hMin)/(hMax-hMin);  // Height mapped to [0; 1] range.
	vec3 n=normal(tc);
	vec2 pc=principalCurvature(tc);
	
	// TODO
	if (filter == 0)  {
		color.rgb = vec3(h);
	}
	else if(filter == 1){
		color.rgb = vec3(n);
	}
	else if(filter == 2){
		color.rgb=vec3(reliefVal(tc));
	}
	else if(filter == 3){
		color.rgb = vec3(pc.x);
	}
    fragColor  = color;
}

