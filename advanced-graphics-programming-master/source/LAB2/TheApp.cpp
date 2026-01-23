/**
 * ============================================================================
 *  Name        : TheApp.cpp
 *  Part of     : Simple OpenGL graphics engine framework
 *  Description : LAB3
 *  Version     : 1.00
 *	Author		: Jani Immonen, <realdashdev@gmail.com>
 * ============================================================================
**/

#include "TheApp.h"


// constructor, init members
TheApp::TheApp() :
	m_uVertexShader(0),
	m_uFragmentShader(0),
	m_uProgram(0)
{
	// seed the random number generator
	RandSeed();
}


bool TheApp::OnCreate()
{
	// OnCreate is called by the application when window and graphics initialization is complete
	auto renderer = GetOpenGLRenderer();
	m_uVertexShader = renderer->CreateVertexShaderFromFile("triangleshader.vert");
	m_uFragmentShader = renderer->CreateFragmentShaderFromFile("triangleshader.frag");
	m_uProgram = renderer->CreateProgram(m_uVertexShader, m_uFragmentShader);

	// TODO: load a leaf.png texture

	if (!m_uVertexShader || !m_uFragmentShader || !m_uProgram)
	{
		return false;
	}

	// TODO: add texture mapping coordinates to triangle
	m_Triangle[0] = TRIANGLEVERTEX(glm::vec3( 0.5f, -0.5f, 0.0f));
	m_Triangle[1] = TRIANGLEVERTEX(glm::vec3(-0.5f, -0.5f, 0.0f));
	m_Triangle[2] = TRIANGLEVERTEX(glm::vec3( 0.0f,  0.5f, 0.0f));

	return true;
}


void TheApp::OnDestroy()
{
	// app is about to close, clear all resources
	glDeleteProgram(m_uProgram);
	glDeleteShader(m_uFragmentShader);
	glDeleteShader(m_uVertexShader);

	// TODO: delete loaded texture

	m_uVertexShader = 0;
	m_uFragmentShader = 0;
	m_uProgram = 0;
}


void TheApp::OnUpdate(float frametime)
{
}


void TheApp::OnDraw(IRenderer& renderer)
{
	// clear color, depth and stencil buffers
	renderer.Clear(0.2f, 0.2f, 0.2f, 1.0f);

	// setup the rendering program
	glUseProgram(m_uProgram);

	// get the vertex attribute locations
	GLint position = glGetAttribLocation(m_uProgram, "position");

	// set the vertex position
	glEnableVertexAttribArray(position);
	glVertexAttribPointer(position, 3, GL_FLOAT, GL_FALSE, TRIANGLEVERTEX::GetStride(), m_Triangle);

	// TODO: set the texture coordinate attribute to the program

	// set the model matrix
	glm::mat4 model = glm::mat4(1.0f);
	OpenGLRenderer::SetUniformMatrix4(m_uProgram, "modelMatrix", model);

	glDrawArrays(GL_TRIANGLES, 0, 3);
}


void TheApp::OnScreenSizeChanged(uint32_t widthPixels, uint32_t heightPixels)
{
}


bool TheApp::OnKeyDown(uint32_t keyCode)
{
	// TODO: modify texture coordinates when user presses space
	if (keyCode == KEY_ESC)
	{
		Close();
		return true;
	}

	return false;
}

