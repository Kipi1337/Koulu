# Graphics Programming, Assignment 3

You can work on this assignment in groups of 1-3 people.

When the task is complete

1. Delete the temporary files: '.vs', 'x64', 'Debug' and/or 'Release' folders. The *.user file can also be deleted.
2. Add the 'readme.txt' file which contains your name(s), student id(s) and any additional information.
3. Compress the project files into a zip file
4. Upload zip file to Moodle's return box. If working in groups, return same package to each members own return box.


&nbsp;
## Build a Tank

- Take the LAB3 project as a starting point
- Build a tank from three boxes
- Place the tank parts into the scenegraph so that the turret follows the base and the pipe follows the turret
- Perform simple controls:
    - Arrow keys left and right turns tank base
    - Arrow keys up and down move tank base forward and backward
    - 'A' and 'D' rotates turret to the left and right
    - 'W' and 'S' rotates pipe up and down

&nbsp;
### See reference video [here](./lab03-reference.mp4)

Tips:
- You need to declare 3 Geometry objects, one for each piece of Tank.
- You can use one material to all Tank pieces.
- use IApplication::IsKeyDown function to check if certain key is pressed down. For example:

```
if (IsKeyDown(KEY_LEFT))
{
	// arrow key left is down
}

if (IsKeyDown('A'))
{
	// 'A' is down
}
```

&nbsp;
----
**© 2024 Jani Immonen**

