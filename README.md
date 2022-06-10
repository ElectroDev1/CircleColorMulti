<p align="center">
  <img src="https://github.com/ElectroDev1/CircleColorMulti/blob/main/CCM%20logo.png" style="display:block; margin:auto; width:300px">
</p>
<br>
<h1 align="center">CircleColorMulti</h1>
<p align="center" >
  A library for Gamemaker v2.3+ that expands on draw_circle_color

 </p>
 <h2 align="center"><a href="https://github.com/ElectroDev1/CircleColorMulti/releases/tag/v1.0.0">Download the yymps </a></h2>

<hr>

# WHAT IS CIRCLECOLORMULTI

<p>
CircleColorMulti, or CCM in short, is a very small library that allows you to draw colored circles with more colors and more complex patterns that the linear interpolation between two colors that Gamemaker's default draw_circle_color offers.

What CCM allows you to do:

* Draw as many colors in a circle as you want, the colors will be equally distributed along the circle's radius
* Adjust opacity for each color
* Adjust how much one fades from the previous one,in case yoo don't want colors to simply fade from each other in a linear way
* Adjust the position of the color in the radius itself, using a 0 to 1 scale
</p>

<p align="center">
  <img width="400px" height="400px" src="https://github.com/ElectroDev1/CircleColorMulti/blob/main/showcase.gif">
</p>

<hr>

# SETUP AND USAGE

<p>
  
  CCM circles can be drawn just line any normal circle with the draw_circle_color_multi function.
  
  ```gml
draw_circle_color_multi(x,y,radius,[steps],[colors]);
```
  
  * x {real} : the horizontal position where the circle will be drawn
  * y {real} : the vertical position where the circle will be drawn
  * radius {real} : the radius of the circle
  * steps {real} : the number of points the circle will have, check <a href="https://manual.yoyogames.com/GameMaker_Language/GML_Reference/Drawing/Basic_Forms/draw_set_circle_precision.htm">draw_set_circle_precision</a> to learn more how it works. Really high numbers might break the circle.
  * colors {array} : the most important part of the function, in here you will set all the parameters to tell the circle how to render all of the various colors.
  
  <h3>INSERTING COLORS</h3>
  
  ```gml
    [
      color /
      [color, alpha, {fading, factor} ]
      ,...
    ]
```
Colors are inserted in array, and each color can either be a simple color id, or an array containing the other parameters. If you use an array fading and factor are optional.
<br><br>
Fading controls how much the color will fade from the previous one, a value of 1 will make it so that there is no transition between the color and the previous one, but just a hard cut to the new color. This parameter is not applied to the first color.
<br><br>
Factor determines where on the circle the color will be drawn, the value goes from 0 to 1, with 0 being the center of the circle and 1 being its edge, this parameter is useful if you don't want colors to be distributed equally along the circle.
<br>
<br>
<h3>THE CCM FUNCTION</h3>
CCM has a special CCM() function that lets you control a circle like a struct, the struct contains various functions that can be used to alter and draw multiple versions of the same circle.
<br>

```gml
   my_ccm = CCM(radius,[colors],[name]);
```
The arguments are the same as stated before, name is simply a way to group CCMs better but it's not required.

Functions can be used like this:

```gml
  my_ccm.draw(50,50);
  my_ccm.opacity(0.5).draw(100,50);
```

Be careful when you use functions that alter the circle's look, as those will be present anytime you draw the circle after using the function.

<br>
<h3>List of functions:</h3>

<h3>draw(x, y) - Draws the circle</h3>
   - x : the horizontal position where the circle will be drawn<br>
   - y : the vertical position where the circle will be drawn
   
   
<h3>transform([xscale], [yscale]) - Scales the circle</h3>
   - xscale : the horizontal scaling that will be applied to the circle<br>
   - yscale : the vertical scaling that will be applied to the circle
   
   
<h3>angle(direction) - Changes the angle of the circle's segments along its radius</h3>
   - direction : the direction that will be added to the circle's points, the rotation will only be visible on low segment circles
    
    
<h3>opacity(value) - Changes the circle's overall alpha value</h3>
   - value : the alpha value that will be applied to the circle
   
   
<h3>blend(mode) - Applies a blend mode to the circle</h3>
   - mode : the blend mode that will be used by the circle
   
   
<h3>segments(num) - Changes the amount of segments in the circle</h3>
   - num : the number of segments the circle will have
   
   
<h3>drawName([x], [y]) - Draws the circle's name</h3>
   - x : the horizontal position where the name will be drawn<br>
   - y : the vertical position where the name will be drawn
   
<br><br>

Always remember to get rid of the struct once it's not needed anymore.
 </p>
 
 <hr>
 
 # ABOUT AND CREDITS
Surfs is licensed under the <a href="https://github.com/ElectroDev1/CircleColorMulti/blob/main/LICENSE.md">MIT license</a>
<br><br>
Surfs made by <a href="https://github.com/ElectroDev1">Electro</a>
