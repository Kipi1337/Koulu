/**
* ============================================================================
*  Name        : GeometryNode.cpp
*  Part of     : Simple OpenGL graphics engine framework
*  Description : Scenegraph node capable of rendering geometry object with 
*                material.
*  Version     : 1.00
*	Author      : Jani Immonen, <realdashdev@gmail.com>
* ============================================================================
**/

#include "../include/GeometryNode.h"
#include "../include/Geometry.h"
#include "../include/Material.h"


void GeometryNode::Render(IRenderer& renderer, GLuint program)
{
	if (m_pGeometry)
	{
		m_pGeometry->SetAttribs(program);

		// set model matrix to shader uniform
		const glm::mat4 worldMatrix(GetWorldMatrix());
		OpenGLRenderer::SetUniformMatrix4(program, "modelMatrix", worldMatrix);

		// set model-view-projection matrix to shader uniform
		const glm::mat4 modelViewProjectionMatrix(renderer.GetProjectionMatrix() * renderer.GetViewMatrix() * worldMatrix);
		OpenGLRenderer::SetUniformMatrix4(program, "modelViewProjectionMatrix", modelViewProjectionMatrix);

		// set the material to the program
		if (m_pMaterial)
		{
			m_pMaterial->SetToProgram(program);
		}

		// set the textures
		char name[16] = "texture01";
		for (uint32_t slot=0; slot<m_arrTextures.size(); ++slot)
		{
			auto texture = m_arrTextures[slot];
			if (texture)
			{
				renderer.SetTexture(program, texture, slot, name);
				glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, m_arrTextureWrapModes[slot]);
				glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, m_arrTextureWrapModes[slot]);
			}

			++name[8];
		}

		m_pGeometry->Draw(renderer);
	}

	Node::Render(renderer, program);
}

