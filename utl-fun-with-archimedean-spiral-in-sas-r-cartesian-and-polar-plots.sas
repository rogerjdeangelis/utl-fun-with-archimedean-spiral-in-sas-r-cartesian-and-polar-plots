%let pgm=utl-fun-with-archimedean-spiral-in-sas-r-cartesian-and-polar-plots;

Fun with archimedean spiral in sas r cartesian and polar plots

github
https://tinyurl.com/4t3bvyn5
https://github.com/rogerjdeangelis/utl-fun-with-archimedean-spiral-in-sas-r-cartesian-and-polar-plots

inspired by
http://stackoverflow.com/questions/41391271/plot-an-archimedean-spiral-in-r-with-ggplot2

   SOLUTIONS (links are to hi res graphics)                                                                                                 
                                                                                                                                            
       0 sas ascii line plot                                                                                                                
         se below                                                                                                                           
                                                                                                                                            
       1 r polar coordinates (r,r*theta)                                                                                                    
         https://tinyurl.com/538zk9cs                                                                                                       
                                                                                                                                            
         https://github.com/rogerjdeangelis/utl-fun-with-archimedean-spiral-in-sas-r-cartesian-and-polar-plots/blob/main/r_polar.png        
       2 r cartesian (x,y) plot (cos(theta), r * sin(theta))                                                                                
         https://tinyurl.com/yc83sfr4                                                                                                       
         https://github.com/rogerjdeangelis/utl-fun-with-archimedean-spiral-in-sas-r-cartesian-and-polar-plots/blob/main/r_cartesian.png    
                                                                                                                                            
       3 sas cartesian (x,y) plot (cos(theta), r * sin(theta))                                                                              
         https://tinyurl.com/z6w4pmyb                                                                                                       
         https://github.com/rogerjdeangelis/utl-fun-with-archimedean-spiral-in-sas-r-cartesian-and-polar-plots/blob/main/sas_cartesian.png  

/*               _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/

/**************************************************************************************************************************/
/*                                          |                                  |                                          */
/*                                          |                                  |                                          */
/* data spiral;                             |options ls=64 ps=32;              |                      X                   */
/* do theta=0 to 10*constant("PI")/2 by .05;|proc plot data=spiral(rename=     |     -40     -20      0      20     40    */
/*    r = 1 + 2*theta;                      | y=y1235678901234567890123456);   |   +-+-------+-------+-------+-----+-+    */
/*    x=r*cos(theta);                       |                                  | 40+                                 +40  */
/*    y=r*sin(theta);                       | plot y1235678901234567890123456*x|   |                                 |    */
/*    keep x y;                             |    ="#" /box;                    |   |                                 |    */
/* output;                                  | Run;quit;                        |   |          ###########            |    */
/* end;                                     |                                  |   |       ####          ###         |    */
/* run;quit;                                |                                  | 20+      ##               ##        +20  */
/*                                          |                                  |   |     ##     ########     #       |    */
/*                                          |                                  |   |    ##    ##       ##    ##      |    */
/*                                          |                                  |   |   ##    #           #    #      |    */
/*                                          |                                  |   |   #    ##    ####   #    #      |    */
/*                                          |                                  |Y 0+   #    #    #  ##   #    #      +0 Y */
/*                                          |                                  |   |        #    #      ##    #      |    */
/*                                          |                                  |   |        ##   ###  ###    ##      |    */
/*                                          |                                  |   |         #      ###     ##       |    */
/*                                          |                                  |   |          ##           ##        |    */
/*                                          |                                  | 20+           ####     ###          +-20 */
/*                                          |                                  |   |              ######             |    */
/*                                          |                                  |   |                                 |    */
/*                                          |                                  |   | The Archimedean spiral is       |    */
/*                                          |                                  |   | a plane curve that is named     |    */
/*                                          |                                  | 40+ after the Greek mathematicia    +-40 */
/*                                          |                                  |   | Archimedes, who lived           |    */
/*                                          |                                  |   | rd century BC.                  |    */
/*                                          |                                  |   |                                 |    */
/*                                          |                                  |   -+-------+-------+-------+------+--    */
/*                                          |                                  |    -40     -20      0      20     40     */
/*                                          |                                  |                                          */
/**************************************************************************************************************************/

/*___                                   _ _         _       _
 / _ \   ___  __ _ ___    __ _ ___  ___(_|_)  _ __ | | ___ | |_
| | | | / __|/ _` / __|  / _` / __|/ __| | | | `_ \| |/ _ \| __|
| |_| | \__ \ (_| \__ \ | (_| \__ \ (__| | | | |_) | | (_) | |_
 \___/  |___/\__,_|___/  \__,_|___/\___|_|_| | .__/|_|\___/ \__|
 _                   _                       |_|
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

data spiral;
do theta=0 to 10*constant("PI")/2 by .05;
   r = 1 + 2*theta;
   x=r*cos(theta);
   y=r*sin(theta);
   keep x y;
output;
end;
run;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*  WORK.SPIRAL                                                                                                           */
/*                                                                                                                        */
/*      X          Y                                                                                                      */
/*                                                                                                                        */
/*   1.00000    0.00000                                                                                                   */
/*   1.09863    0.05498                                                                                                   */
/*   1.19400    0.11980                                                                                                   */
/*   1.28540    0.19427                                                                                                   */
/*   1.37209    0.27814                                                                                                   */
/*  ...                                                                                                                   */
/*  -31.3105     6.6070                                                                                                   */
/*  -31.7003     5.0496                                                                                                   */
/*  -32.0125     3.4697                                                                                                   */
/*  -32.2458     1.8712                                                                                                   */
/*  -32.3990     0.2580                                                                                                   */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

options ls=64 ps=32;

proc plot data=spiral(rename=
  y=y1235678901234567890123456);

  plot y1235678901234567890123456*x="#" /box;

run;quit;

options ls=255 ps=65;

/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/

/**************************************************************************************************************************/
/*                                                                                                                        */
/*                                                                                                                        */
/*      -40     -20      0      20      40                                                                                */
/*     --+-------+-------+-------+-------+--                                                                              */
/*  40+                                   + 40                                                                            */
/*    |                                   |                                                                               */
/*    |                                   |                                                                               */
/*    |           ###########             |                                                                               */
/*    |        ####          ###          |                                                                               */
/*  20+       ##               ##         + 20                                                                            */
/*    |      ##     ########     #        |                                                                               */
/*    |     ##    ##       ##    ##       |                                                                               */
/*    |    ##    #           #    #       |                                                                               */
/*    |    #    ##    ####   #    #       |                                                                               */
/*   0+    #    #    #  ##   #    #       +  0                                                                            */
/*    |         #    #      ##    #       |                                                                               */
/*    |         ##   ###  ###    ##       |                                                                               */
/*    |          #      ###     ##        |                                                                               */
/*    |           ##           ##         |                                                                               */
/* -20+            ####     ###           +-20                                                                            */
/*    |               ######              |                                                                               */
/*    |                                   |                                                                               */
/*    |  The Archimedean spiral is        |                                                                               */
/*    |  a plane curve that is named      |                                                                               */
/* -40+  after the Greek mathematician    +-40                                                                            */
/*    |  Archimedes, who lived            |                                                                               */
/*    |  rd century BC.                   |                                                                               */
/*    |                                   |                                                                               */
/*    --+-------+-------+-------+-------+--                                                                               */
/*     -40     -20      0      20      40                                                                                 */
/*                                                                                                                        */
/**************************************************************************************************************************/


/*                      _                    _       _
/ |  _ __   _ __   ___ | | __ _ _ __   _ __ | | ___ | |_
| | | `__| | `_ \ / _ \| |/ _` | `__| | `_ \| |/ _ \| __|
| | | |    | |_) | (_) | | (_| | |    | |_) | | (_) | |_
|_| |_|    | .__/ \___/|_|\__,_|_|    | .__/|_|\___/ \__|
 _         |_|       _                |_|
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

options validvarname=upcase;
libname sd1 "d:/sd1";
data sd1.r_theta;
 retain r 2;
 do theta=0 to 2*constant('pi') by .06;
   output;
end;
run;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*  Obs   R    THETA                                                                                                      */
/*                                                                                                                        */
/*   1    2     0.00                                                                                                      */
/*   2    2     0.06                                                                                                      */
/*   3    2     0.12                                                                                                      */
/*   4    2     0.18                                                                                                      */
/*   5    2     0.24                                                                                                      */
/* ...                                                                                                                    */
/* 102    2     6.06                                                                                                      */
/* 103    2     6.12                                                                                                      */
/* 104    2     6.18                                                                                                      */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

%utlfkil(d:/png/r_polar.png);

%utl_rbegin;
parmcards4;
library(ggplot2)
library(haven)
png("d:/png/r_polar.png", width = 3, height = 3, units = "in", res=150);
df<-read_sas("d:/sd1/r_theta.sas7bdat");
ggplot(df, aes(x = THETA,  y = R*THETA)) +
  geom_path() +
  coord_polar()
png()
want<-df;
;;;;
%utl_rend;

/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/

/**************************************************************************************************************************/
/*                         6                                                                                              */
/*                                                                                                                        */
/*                     ****+****                                                                                          */
/*                ******   1   ******                                                                                     */
/*              ***        1        ***                                                                                   */
/*            ***          1          ***                                                                                 */
/*          ***             oo          **                                                                                */
/*         **              1 oo           **                                                                              */
/*        **               1   oo          **                                                                             */
/*        *                1     o          *                                                                             */
/*       **                1     oo         **                                                                            */
/*       *                 1      o          *                                                                            */
/*   3   *---------- oooooo       oo         *                                                                            */
/*       *          oo     o       o         *                                                                            */
/*       **         o       o     oo        **                                                                            */
/*        *         o      1      o         *                                                                             */
/*        **        o      1     oo        **                                                                             */
/*         **       oo     1    oo        **                                                                              */
/*          ***      oo    1   oo       ***                                                                               */
/*            ***      oooooooo         ***                                                                               */
/*              ***        1        ***                                                                                   */
/*                *****    1   ******                                                                                     */
/*                     ********                                                                                           */
/*                         0                                                                                              */
/*                                                                                                                        */
/**************************************************************************************************************************/


/*___                          _            _
|___ \   _ __    ___ __ _ _ __| |_ ___  ___(_) __ _ _ __
  __) | | `__|  / __/ _` | `__| __/ _ \/ __| |/ _` | `_ \
 / __/  | |    | (_| (_| | |  | ||  __/\__ \ | (_| | | | |
|_____| |_|     \___\__,_|_|   \__\___||___/_|\__,_|_| |_|
 _                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

options validvarname=upcase;
data sd1.xy;
  do t=0 to 10 by .01;
   x = t*cos(t);
   y = t*sin(t);
   keep x y;
   output;
  end;
run;quit;

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

%utlfkil(d:/png/r_catesian.png);

%utl_rbegin;
parmcards4;
library(ggplot2)
library(haven)
xy<-read_sas("d:/sd1/xy.sas7bdat")
xy
png("d:/png/r_cartesian.png", width = 3, height = 3, units = "in", res=150)
ggplot(xy, aes(x=X,y=Y)) + geom_path()
png()
;;;;
%utl_rend;

/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/

/**************************************************************************************************************************/
/*                                                                                                                        */
/*                                                                                                                        */
/*      -10     -5        0      5      10                                                                                */
/*     --+-------+-------+-------+-------+--                                                                              */
/*  10+                                     +10                                                                           */
/*    |                                     |                                                                             */
/*    |                                     |                                                                             */
/*    |           ###########               |                                                                             */
/*    |        ####          ###            |                                                                             */
/*  5+       ##               ##            +5                                                                            */
/*    |      ##     ########     #          |                                                                             */
/*    |     ##    ##       ##    ##         |                                                                             */
/*    |    ##    #           #    #         |                                                                             */
/*    |    #    ##    ####   #    #         |                                                                             */
/* Y 0+    #    #    #  ##   #    #         +0                                                                            */
/*    |         #    #      ##    #         |                                                                             */
/*    |         ##   ###  ###    ##         |                                                                             */
/*    |          #      ###     ##          |                                                                             */
/*    |           ##           ##           |                                                                             */
/* -5+            ####     ###              +-5                                                                           */
/*    |               ######                |                                                                             */
/*    |                                     |                                                                             */
/*    |                                     |                                                                             */
/* -10+                                     +-10                                                                          */
/*    |                                     |                                                                             */
/*    --+-------+-------+-------+-------+--                                                                               */
/*     -10     -5       0       5      10                                                                                 */
/*                      X                                                                                                  */
/*                                                                                                                        */
/**************************************************************************************************************************/


/*____                                  _            _                               _       _
|___ /   ___  __ _ ___    ___ __ _ _ __| |_ ___  ___(_) __ _ _ __    ___  __ _ _ __ | | ___ | |_
  |_ \  / __|/ _` / __|  / __/ _` | `__| __/ _ \/ __| |/ _` | `_ \  / __|/ _` | `_ \| |/ _ \| __|
 ___) | \__ \ (_| \__ \ | (_| (_| | |  | ||  __/\__ \ | (_| | | | | \__ \ (_| | |_) | | (_) | |_
|____/  |___/\__,_|___/  \___\__,_|_|   \__\___||___/_|\__,_|_| |_| |___/\__, | .__/|_|\___/ \__|
 _                   _                                                      |_|_|
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

data spiral;
a = 1;
b = 2;
do theta=0 to 10*constant("PI")/2 by .05;
   r = a + b*theta;
   x=r*cos(theta);
   y=r*sin(theta);
output;
end;
run;quit;
/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/
ods graphics on / reset imagename="sas_cartesian" width=3in height=3in;
ods listing  gpath='d:/png' image_dpi=200;
proc sgplot data=spiral nowall noborder pad=0;
  series x=x y=y / smoothconnect;
run;
ods graphics off;
ods listing;

/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/

/**************************************************************************************************************************/
/*                                                                                                                        */
/*                                                                                                                        */
/*      -10     -5        0      5      10                                                                                */
/*     --+-------+-------+-------+-------+--                                                                              */
/*  10+                                     +10                                                                           */
/*    |                                     |                                                                             */
/*    |                                     |                                                                             */
/*    |           ###########               |                                                                             */
/*    |        ####          ###            |                                                                             */
/*  5+       ##               ##            +5                                                                            */
/*    |      ##     ########     #          |                                                                             */
/*    |     ##    ##       ##    ##         |                                                                             */
/*    |    ##    #           #    #         |                                                                             */
/*    |    #    ##    ####   #    #         |                                                                             */
/* Y 0+    #    #    #  ##   #    #         +0                                                                            */
/*    |         #    #      ##    #         |                                                                             */
/*    |         ##   ###  ###    ##         |                                                                             */
/*    |          #      ###     ##          |                                                                             */
/*    |           ##           ##           |                                                                             */
/* -5+            ####     ###              +-5                                                                           */
/*    |               ######                |                                                                             */
/*    |                                     |                                                                             */
/*    |                                     |                                                                             */
/* -10+                                     +-10                                                                          */
/*    |                                     |                                                                             */
/*    --+-------+-------+-------+-------+--                                                                               */
/*     -10     -5       0       5      10                                                                                 */
/*                      X                                                                                                  */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
