draw_set_halign(fa_left); draw_set_valign(fa_top);
draw_text(10,10,"CircleColorMulti by Electro");

draw_set_halign(fa_center); draw_set_valign(fa_bottom);
draw_set_font(fnt_game);

draw_text(room_width/2-radius*4-20,room_height/2-radius/2-50,"Default\ndraw_circle_color");

draw_circle_color(room_width/2-radius*4-20,room_height/2,radius,c_red,c_blue,0);

//CCM

draw_text(room_width/2,room_height/2-radius/2-50,"New\ndraw_circle_color_multi");

var _test = CCM(radius,[c_red,c_red,[c_orange,0.5,1],[c_yellow,1,0]],"ID: 0")

_test.transform(0.8+sin(current_time*0.01)*0.2,0.8+cos(current_time*0.01)*0.2)
.segments(10)
.draw(room_width/2,room_height/2)
.drawName()


_test.transform(1,1)
.segments(3)
.opacity(0.5)
.angle(current_time/10).
draw(room_width/2,room_height/2+radius*2+10)
.drawName()
;


CCM(radius,[ [c_yellow,0.4,1,0.75], [c_orange,0.4,1] ])
.angle(current_time/10)
.segments(6)
.transform(0.4,1.6)
.draw(room_width/2+radius*2+10,room_height/2);

var _c3 = CCM(radius,[ [c_white,1,0,0.2+sin(current_time*0.01)*0.2],[c_red,0,1,0.6+sin(current_time*0.01)*0.2],
[c_aqua,0.1,1],c_white ])


_c3.draw(room_width/2+radius*3+30+sin(current_time*0.002)*radius
,room_height/2+cos(current_time*0.01)*80);

_c3.transform(0.2+cos(current_time*0.001),sin(current_time*0.001))
.opacity(0.75+0.5*cos(current_time*0.01))
.blend(bm_max)
.draw(room_width-radius*2,radius)