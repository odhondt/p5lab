---
layout: post
title:  "Color cube"
---
Drag to move the cube.

<canvas data-processing-sources="{{ site.url }}/sketches/color_cube/color_cube.pde"></canvas>

This is a 3D color representation of a picture I have shot in La Barceloneta, the harbour of Barcelona.

I will try to keep improving this as it is quite useful when you are working in image processing.
The code could probably be faster although I already reduced the color quantization to 64 instead of 256.
I also remove redundant colors so that the number of points to draw is smaller.
The GUI could be improved by adding transparency as a function of the point density, displaying info such as stats, view angle, etc.
I'll add a link to the photo soon.
Mouse wheel should (un)zoom however, it only scrolls the page. Looking for a way to keep focus on the canvas while the mouse is on it. Any tip?

Please feel free to post comments / suggestions on [tyldurd@twitter](https://twitter.com/tyldurd).
