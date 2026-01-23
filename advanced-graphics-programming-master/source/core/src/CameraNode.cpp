/**
 * ============================================================================
 *  Name        : CameraNode.cpp
 *  Part of     : Simple OpenGL graphics engine framework
 *  Description : Scenegraph camera node.
 *  Version     : 1.00
 *	Author      : Jani Immonen, <realdashdev@gmail.com>
 * ============================================================================
**/

#include "../include/CameraNode.h"


void CameraNode::SetProjectionParams(float fov, float aspect, float nearplane, float farplane)
{
	m_mProjection = glm::perspective(fov, aspect, nearplane, farplane);

	m_fFov = fov;
	m_fAspect = aspect;
	m_fNearplane = nearplane;
	m_fFarplane = farplane;
}

