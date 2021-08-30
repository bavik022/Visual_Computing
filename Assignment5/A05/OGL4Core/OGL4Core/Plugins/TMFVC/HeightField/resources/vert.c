#version 330

uniform mat4 pvm;

layout(location = 0) in vec4  in_position;

out vec2 texCoords;

void main()
{
    vec2 vert = in_position.xy;
    texCoords = vert.xy;
    gl_Position = pvm * vec4(vert,0,1);
}
