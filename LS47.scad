
// No license, but send me a hello if you use this for some good purpose.
// -- Mirek Kratochvil <exa.exa@gmail.com>

//TODO: round corners?

font = "Consolas"; //URW Bookman L looks nicely here as well
font2 = "Century Schoolbook";

//inch-sized tiles look imperial.
tilesize=32;
//you might like them a bit larger if you want to use this in nature.

//distance between tiles
off=tilesize*1.25;
//height 1/8"
tileheight=tilesize/8;

//this produces one tile
module tilec(letter, x, y, c, lang) {
  translate([x*off,(6-y)*off,0]) {
    difference() {
      color(c)
      cube([tilesize,tilesize,tileheight]);
      color(c)
        translate([tilesize*.4,tilesize*.4,tileheight*.51])
        linear_extrude (height=tileheight/2)
          text(letter, font=font, size=tilesize*.5,
               halign="center", valign="baseline");
      color(c)
      translate([tilesize*.83, tilesize/2, tileheight*.76])
        linear_extrude(height=tileheight/4)
          text(str(x), font=font2, size=tilesize*.2,
               halign="center", valign="center");
      color(c)
      translate([tilesize/2, tilesize*.14, tileheight*.76])
        linear_extrude(height=tileheight/4)
          text(str(y), font=font2, size=tilesize*.2,
               halign="center", valign="center");
      color(c)
      translate([tilesize*.88, tilesize*.83, tileheight*.76])
        linear_extrude(height=tileheight/4)
          text(lang, font=font2, size=tilesize*.125,
               halign="right", valign="center");
    }
  }
}

//tiles
module tile(letter,x,y,lang) {
   tilec(letter,x,y,"darkgray",lang);
}

module tiles(
    lang,
    letter_0_0, letter_1_0, letter_2_0, letter_3_0, letter_4_0, letter_5_0, letter_6_0,
    letter_0_1, letter_1_1, letter_2_1, letter_3_1, letter_4_1, letter_5_1, letter_6_1,
    letter_0_2, letter_1_2, letter_2_2, letter_3_2, letter_4_2, letter_5_2, letter_6_2,
    letter_0_3, letter_1_3, letter_2_3, letter_3_3, letter_4_3, letter_5_3, letter_6_3,
    letter_0_4, letter_1_4, letter_2_4, letter_3_4, letter_4_4, letter_5_4, letter_6_4,
    letter_0_5, letter_1_5, letter_2_5, letter_3_5, letter_4_5, letter_5_5, letter_6_5,
    letter_0_6, letter_1_6, letter_2_6, letter_3_6, letter_4_6, letter_5_6, letter_6_6
) {
    tile(letter_0_0, 0, 0, lang);
    tile(letter_1_0, 1, 0, lang);
    tile(letter_2_0, 2, 0, lang);
    tile(letter_3_0, 3, 0, lang);
    tile(letter_4_0, 4, 0, lang);
    tile(letter_5_0, 5, 0, lang);
    tile(letter_6_0, 6, 0, lang);
    tile(letter_0_1, 0, 1, lang);
    tile(letter_1_1, 1, 1, lang);
    tile(letter_2_1, 2, 1, lang);
    tile(letter_3_1, 3, 1, lang);
    tile(letter_4_1, 4, 1, lang);
    tile(letter_5_1, 5, 1, lang);
    tile(letter_6_1, 6, 1, lang);
    tile(letter_0_2, 0, 2, lang);
    tile(letter_1_2, 1, 2, lang);
    tile(letter_2_2, 2, 2, lang);
    tile(letter_3_2, 3, 2, lang);
    tile(letter_4_2, 4, 2, lang);
    tile(letter_5_2, 5, 2, lang);
    tile(letter_6_2, 6, 2, lang);
    tile(letter_0_3, 0, 3, lang);
    tile(letter_1_3, 1, 3, lang);
    tile(letter_2_3, 2, 3, lang);
    tile(letter_3_3, 3, 3, lang);
    tile(letter_4_3, 4, 3, lang);
    tile(letter_5_3, 5, 3, lang);
    tile(letter_6_3, 6, 3, lang);
    tile(letter_0_4, 0, 4, lang);
    tile(letter_1_4, 1, 4, lang);
    tile(letter_2_4, 2, 4, lang);
    tile(letter_3_4, 3, 4, lang);
    tile(letter_4_4, 4, 4, lang);
    tile(letter_5_4, 5, 4, lang);
    tile(letter_6_4, 6, 4, lang);
    tile(letter_0_5, 0, 5, lang);
    tile(letter_1_5, 1, 5, lang);
    tile(letter_2_5, 2, 5, lang);
    tile(letter_3_5, 3, 5, lang);
    tile(letter_4_5, 4, 5, lang);
    tile(letter_5_5, 5, 5, lang);
    tile(letter_6_5, 6, 5, lang);
    tile(letter_0_6, 0, 6, lang);
    tile(letter_1_6, 1, 6, lang);
    tile(letter_2_6, 2, 6, lang);
    tile(letter_3_6, 3, 6, lang);
    tile(letter_4_6, 4, 6, lang);
    tile(letter_5_6, 5, 6, lang);
    tile(letter_6_6, 6, 6, lang);
}

tiles(
    "EN",
    "_", "A", "B", "C", "D", "E", "F",
    "G", "H", "I", "J", "K", "L", "M",
    "N", "O", "P", "Q", "R", "S", "T",
    "U", "V", "W", "X", "Y", "Z", ".",
    "0", "1", "2", "3", "4", "5", "6",
    "7", "8", "9", ",", "-", "+", "*",
    "/", ":", "?", "!", "'", "(", ")"
)

//the token
translate([-off/2,off/2,0]) {
    color("red") difference() {
      cylinder(h=tileheight, d=tilesize*.7);
      translate([0,0,-.1])
        cylinder(h=tileheight*1.2, d=tilesize*.7-tileheight);
    }
}
