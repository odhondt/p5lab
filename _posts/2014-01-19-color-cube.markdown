---
layout: post
comments: true
title:  "Color cube"
---
Drag with the mouse to move the cube.

<script src="/p5lab/processing.js" type="text/javascript"></script>
<canvas data-processing-sources="/p5lab/sketches/color_cube/color_cube.pde"></canvas>

This is a 3D color representation of a picture I have shot in La Barceloneta, the harbour of Barcelona.

I will try to keep improving this as it is quite useful when you are working in image processing.
The code could probably be faster although I already reduced the color quantization to 64 instead of 256.
I also remove redundant colors so that the number of points to draw is smaller.
The GUI could be improved by adding transparency as a function of the point density, displaying info such as stats, view angle, etc.
I'll add a link to the photo soon.
Mouse wheel should (un)zoom however, it only scrolls the page. Looking for a way to keep focus on the canvas while the mouse is on it. Any tip?
