function draw_circle_color_multi(x,y,radius,steps=40,colors=[c_white,c_white],size=[1,1],
dir=0,blend=bm_normal,alpha=1){
	
	/*
	How to enter color arguments
	
	[
	  [color,alpha,fad,fac]...	 
	]
	
	you can also just use the color without an array, the main array
	must always be present though
	
	fad determines how much two colors will be faded between each other at
	the start of a color chunk
	circles are divided in chunks depending on the number of color entries
	
	fac determines the position (from 0 to 1) within the radius, by default
	it'll place the chunk after the previous one, but this can let you
	give specific chunks bigger sizes than others
	
	fad and fac are optional
	*/
	
	//Start primitive drawing
	draw_primitive_begin(pr_trianglestrip);gpu_set_blendmode(blend);
	
	//Get the amount of color entries and loop through them
	var _colornum = array_length(colors);
	
	for(var a=0; a<_colornum; a++){
		
		var _colarr = colors[a];
		
		var _fac = -4; var _fad=0;
		
		if(a==0){ _fac=0.00001; }
		
		//Get chunk information
		if(!is_array(_colarr)){
		   var _color = _colarr;
		   var _alpha = 1;
		}else{
			
		   var _color = _colarr[0];
		   var _alpha = _colarr[1];
		   
		   
		   if(array_length(_colarr)>2){_fad = _colarr[2];}
		   if(array_length(_colarr)>3){_fac = _colarr[3];}
		}
		
		//Get information about the previous chunk
		var _prevcol = _color; var _prevalpha = _alpha;
		var _prevfac = -4; 
		
		if(a==1){_prevfac=0.00001;}
		
		if(a>0){
			var _prevarr = colors[a-1];
			
			if(!is_array(_prevarr)){
			   var _prevcol = _prevarr;
			   var _prevalpha = 1;
			}else{
			   var _prevcol = _prevarr[0];
			   var _prevalpha = _prevarr[1];
			   
			   if(array_length(_prevarr)>3){_prevfac = _prevarr[3];}
			}		
			
			_prevcol = merge_color(_prevcol,_color,_fad);
		}
		
		//Determine the radius
		var _oradius = radius/_colornum*(a);
		
		if(_prevfac!=-4){
		   _oradius = clamp(radius*_prevfac,0,radius);
		}
		
		var _nradius = radius/_colornum*(a+1);
		
		if(_fac!=-4){
		   _nradius = clamp(radius*_fac,0,radius);
		}
		
		//Draw vertices	
		for(var i = 0; i <= steps; ++i;)
		{
			var _angle = (360/steps)*i + dir;
			
			draw_vertex_color(x + lengthdir_x(_oradius*size[0],_angle), 
			y + lengthdir_y(_oradius*size[1],_angle),_prevcol,_prevalpha*alpha);
				
			draw_vertex_color(x + lengthdir_x(_nradius*size[0],_angle),
			y + lengthdir_y(_nradius*size[1],_angle),_color,_alpha*alpha);
		}
		
	}
	
	//End drawing
    draw_primitive_end();
	
	gpu_set_blendmode(bm_normal);
	
}

function CreateCCM(name="DefaultName",rad,colors=[[draw_get_color(),draw_get_alpha(),1]]) constructor {
	radius = rad;	
	coldata = colors;
	res = 32;
	size= [1,1];
	dir = 0;
	blendmode = bm_normal;
	alpha = 1;
	myName = name;
	myX=0;myY=0;
	
	transform = function(size1=1,size2=2){
	   size = [size1,size2];
	   return self;
	}
	
	segments = function(steps){ res=steps; return self; }
	
	angle = function(direction){ dir=direction; return self; }
	
    blend = function(bm){ blendmode=bm; return self; }
	
	opacity = function(a){ alpha=a; return self; }
	
	draw = function(x,y){draw_circle_color_multi(x,y,radius,res,coldata,size,dir,blendmode,alpha); 
		                 myX=x; myY=y;
						 return self;
    }
	
	drawName = function(x=myX,y=myY){
	   draw_text(x,y,myName); return self;	
	} 
	
}

function CCM(rad,colors=[[draw_get_color(),draw_get_alpha(),1]],name="DefaultName"){ 
	return new CreateCCM(name,rad,colors);
}