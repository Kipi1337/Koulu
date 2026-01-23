# Graphics Programming - 5 credits
**JAMK IT-institute**

&nbsp;
## General

Materials © Jani Immonen

Lecturer: Jani Immonen - jani.immonen@jamk.fi

Course info in [PEPPI](https://opetussuunnitelmat.peppi.jamk.fi/en/course_unit/TTC8830).


&nbsp;
## Learning outcomes
We will delve into lowest level of graphics programming with OpenGL programmable pipeline while maintaining maximum device compatibility. Our principle is to gain proper understanding of the required inner workings. In real life though, it does not make much sense to do everything from the scratch or in such low level.

The 'Engine' parts are included in 'core' folder of the project. This includes a snapshot copy of the glm math library and stb-image for texture loading. In real world, the engine bits should be built into its own library, but in these examples engine code is compiled with the lesson sources.

The included source code is released on 'NoLicense', do what ever you like with it.


&nbsp;
## Schedule

**Lessons on Tuesdays 14:15 - 16:45**

| Week &nbsp; &nbsp;&nbsp; &nbsp; | Contents &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | Lesson tasks &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; | More info |
|:--------------|:-------------------|:----------|:----------|
| 35 | [Course Introduction](https://gitlab.labranet.jamk.fi/immja/ttow0430/-/blob/master/materials/01-course-introducton.md) | | |
| 35 | [Graphics APIs](https://gitlab.labranet.jamk.fi/immja/ttow0430/-/blob/master/materials/02-graphics-apis.md) | | |
| 35 | [Intro to Project Template](https://gitlab.labranet.jamk.fi/immja/ttow0430/-/blob/master/materials/03-framework.md) | | |
| 36 | [Coordinate System](https://gitlab.labranet.jamk.fi/immja/ttow0430/-/blob/master/materials/03-framework.md) | | |
| 37 | [Shaders and Programs](https://gitlab.labranet.jamk.fi/immja/ttow0430/-/blob/master/materials/04-shaders.md) | | [OpenGL shaders (with GLSL)](https://learnopengl.com/Getting-started/Shaders) |
| 38 | [Vertex data](https://gitlab.labranet.jamk.fi/immja/ttow0430/-/blob/master/materials/05-vertices.md) | | [Vertices](https://learnopengl.com/Getting-started/Hello-Triangle) |
| 38 | [Transformations](https://gitlab.labranet.jamk.fi/immja/ttow0430/-/blob/master/materials/06-transformations.md) | [Assignment 1 (DL 15.2.2024)](https://gitlab.labranet.jamk.fi/immja/ttow0430/-/blob/master/labs/lab01.md) | [Transformations](https://learnopengl.com/Getting-started/Transformations)<br>[Coordinate systems](https://learnopengl.com/Getting-started/Coordinate-Systems) <br>[Camera](https://learnopengl.com/Getting-started/Camera) |
| 39 | [Texturing](https://gitlab.labranet.jamk.fi/immja/ttow0430/-/blob/master/materials/07-texturing.md) | [Assignment 2 (DL 22.2.2024)](https://gitlab.labranet.jamk.fi/immja/ttow0430/-/blob/master/labs/lab02.md) | [Texturing](https://learnopengl.com/Getting-started/Textures) |
| 40 | [SceneGraph and hierarchial systems](https://gitlab.labranet.jamk.fi/immja/ttow0430/-/blob/master/materials/08-scenegraph.md) | | |
| 41 | [Lighting, gouraud shading](https://gitlab.labranet.jamk.fi/immja/ttow0430/-/blob/master/materials/09-gouraud.md) | | [Basic Lighting](https://learnopengl.com/Lighting/Basic-Lighting) |
| 42 | Work on Assignments (No Lessons) | | |
| 43 | [Materials](https://gitlab.labranet.jamk.fi/immja/ttow0430/-/blob/master/materials/10-materials.md) | [Material tasks](https://gitlab.labranet.jamk.fi/immja/ttow0430/-/blob/master/tasks/task_multiple_materials.md) | [Materials](https://learnopengl.com/Lighting/Materials) |
| 42 | **Self studying week** | | |
| 43 | [Lighting, phong shading](https://gitlab.labranet.jamk.fi/immja/ttow0430/-/blob/master/materials/11-phong.md) | [Assignment 3 (DL 25.4.2024)](https://gitlab.labranet.jamk.fi/immja/ttow0430/-/blob/master/labs/lab03.md) | [Advanced Lighting](https://learnopengl.com/Advanced-Lighting/Advanced-Lighting) |
| 44 | [Multitexturing](https://gitlab.labranet.jamk.fi/immja/ttow0430/-/blob/master/materials/12-multitexturing.md) | [Assignment 4 (DL 25.4.2024)](https://gitlab.labranet.jamk.fi/immja/ttow0430/-/blob/master/labs/lab04.md) | |
| 45 | [Blending](https://gitlab.labranet.jamk.fi/immja/ttow0430/-/blob/master/materials/13-blending.md) | [Assignment 5 (DL 25.4.2024)](https://gitlab.labranet.jamk.fi/immja/ttow0430/-/blob/master/labs/lab05.md) | [Blending](https://learnopengl.com/Advanced-OpenGL/Blending) |
| 46 | Work on Assignments | | |
| 47 | [Shadow mapping (bonus/advanced)](https://gitlab.labranet.jamk.fi/immja/ttow0430/-/blob/master/materials/14-shadows.md) | | [Shadow mapping](https://learnopengl.com/Advanced-Lighting/Shadows/Shadow-Mapping) |
| 48 | [Shader only programming (bonus)](https://gitlab.labranet.jamk.fi/immja/ttow0430/-/blob/master/materials/15-shader-only-programming.md) | | |
| 49 | Work on Assignments | | |

&nbsp;
## Extra Materials
[OpenGL online tutorial](https://learnopengl.com/)

&nbsp;
## Grading

Grading is based on 5 assignments.

* Each Assignment: max 10 points (50 total).
| Points &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | Grade |
|:--------|:----------:|
| 0 - 9 | 0 |
| 10 - 18 | 1 |
| 19 - 27 | 2 |
| 28 - 36 | 3 |
| 37 - 44 | 4 |
| 45 - 50 | 5 |

