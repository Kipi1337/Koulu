/**
 * ============================================================================
 *  Name        : ShadowObject.cpp
 *  Part of     : Simple OpenGL graphics engine framework
 *  Description : simple game object example
 *  Version     : 1.00
 *	Author		: Jani Immonen, <realdashdev@gmail.com>
 * ============================================================================
**/

#include "ShadowObject.h"



ShadowObject::ShadowObject(const std::shared_ptr<Geometry>& geometry, const std::shared_ptr<Material>& material) :
	GeometryNode(geometry, material),
	m_bShadowCaster(false),
	m_bShadowReceiver(false)
{
}


void ShadowObject::Render(IRenderer& renderer, GLuint program)
{
	if (m_pGeometry)
	{
		// set shadow map matrix
		const glm::mat4 shadowMapMatrix = renderer.GetShadowBiasMatrix() * GetDepthMatrix(renderer.GetLightPos());
		OpenGLRenderer::SetUniformMatrix4(program, "shadowMapMatrix", shadowMapMatrix);

		// set shadow receiver flag
		OpenGLRenderer::SetUniformFloat(program, "shadowReceiver", IsShadowReceiver() ? 1.0f : 0.0f);
	}

	GeometryNode::Render(renderer, program);

	if (m_pGeometry)
	{
		m_pGeometry->DisableAttribs(program);
	}
}


void ShadowObject::DrawShadowOnly(IRenderer& renderer, GLuint program)
{
	if (m_pGeometry)
	{
		// get the vertex attribute locations
		const GLint positionLocation = glGetAttribLocation(program, "position");

		// set the vertex position
		glEnableVertexAttribArray(positionLocation);
		glVertexAttribPointer(
			positionLocation,
			3,
			GL_FLOAT,
			GL_FALSE,
			Geometry::VERTEX::GetStride(),
			m_pGeometry->GetVertices().data());

		// set the shadow map mvp matrix
		OpenGLRenderer::SetUniformMatrix4(program, "modelViewProjectionMatrix", GetDepthMatrix(renderer.GetLightPos()));

		m_pGeometry->Draw(renderer);

		glDisableVertexAttribArray(positionLocation);
	}
}


glm::mat4 ShadowObject::GetDepthMatrix(const glm::vec3& lightPosition) const
{
	const glm::mat4 depthProjectionMatrix = glm::ortho<float>(-10, 10, -10, 10, 1.0f, 5000.0f);
	const glm::mat4 depthViewMatrix = glm::lookAt(lightPosition, glm::vec3(0.0f, 0.0f, 0.0f), glm::vec3(0.0f, 1.0f, 0.0f));
	return depthProjectionMatrix * depthViewMatrix * m_mModel;

	/*
	const glm::mat4 depthProjectionMatrix = glm::perspective<float>(6.0f, 1.0f, 2.0f, 500.0f);
	const glm::mat4 depthViewMatrix = glm::lookAt(lightPosition, glm::vec3(0.0f ,0.0f, 0.0f), glm::vec3(0.0f, 1.0f, 0.0f));
	return depthProjectionMatrix * depthViewMatrix * m_mModel;
	*/
}


