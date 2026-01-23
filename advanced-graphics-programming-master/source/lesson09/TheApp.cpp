/**
 * ============================================================================
 *  Name        : TheApp.cpp
 *  Part of     : Simple OpenGL graphics engine framework
 *  Description : the concrete application layer
 *  Version     : 1.00
 *	Author		: Jani Immonen, <realdashdev@gmail.com>
 * ============================================================================
**/

#include "TheApp.h"


// https://www.shadertoy.com/
// https://glslsandbox.com/

TheApp::TheApp() :
	m_uProgram(0),
	m_fTime(0.0f)
{
	// seed the random number generator
	RandSeed();
}


bool TheApp::OnCreate()
{
	// OnCreate is called by the application when window and graphics initialization is complete
	auto renderer = GetOpenGLRenderer();
	GLuint vertexShader = renderer->CreateVertexShaderFromFile("demo.vert");

	//GLuint fragmentShader = renderer->CreateFragmentShaderFromFile("demo.frag");
	//GLuint fragmentShader = renderer->CreateFragmentShaderFromFile("demo2.frag");
	//GLuint fragmentShader = renderer->CreateFragmentShaderFromFile("fractal.frag");
	//GLuint fragmentShader = renderer->CreateFragmentShaderFromFile("inversion.frag");
	//GLuint fragmentShader = renderer->CreateFragmentShaderFromFile("mandelbulb.frag");
	//GLuint fragmentShader = renderer->CreateFragmentShaderFromFile("truchet.frag");
	GLuint fragmentShader = renderer->CreateFragmentShaderFromFile("terrain.frag");
	m_uProgram = renderer->CreateProgram(vertexShader, fragmentShader);
	if (!vertexShader || !fragmentShader || !m_uProgram)
	{
		return false;
	}

	// store shaders
	m_arrShaders.push_back(vertexShader);
	m_arrShaders.push_back(fragmentShader);

	// generate quad
	m_pQuad = std::make_shared<Geometry>();
	m_pQuad->GenQuad({ 2.0f, 2.0f });

	return true;
}


void TheApp::OnDestroy()
{
	// app is about to close, clear all resources
	glDeleteProgram(m_uProgram);
	m_uProgram = 0;

	for (auto shader : m_arrShaders) glDeleteShader(shader);
	m_arrShaders.clear();
}


void TheApp::OnUpdate(float frametime)
{
	m_fTime += frametime * 0.5f;
}


void TheApp::OnDraw(IRenderer& renderer)
{
	renderer.Clear({ 0.0f, 0.0f, 0.0f, 1.0f });
	glDisable(GL_BLEND);

	glUseProgram(m_uProgram);
	OpenGLRenderer::SetUniformFloat(m_uProgram, "time", m_fTime);
	OpenGLRenderer::SetUniformVec2(m_uProgram, "resolution", { GetWidth(), GetHeight() });

	m_pQuad->SetAttribs(m_uProgram);
	m_pQuad->Draw(renderer);
}


bool TheApp::OnKeyDown(uint32_t keyCode)
{
	switch (keyCode)
	{
	case KEY_ESC:
		Close();
		return true;

	default:
		return false;
	}
}

