//Dimitri Papadedes
//march 27th 2019
//Making a game of galaga 
//to move use arrow keys and to shoot it is the up arrow. to restart after death click enter 

// image variabels
PImage ship;

PImage bee;

PImage fly;

PImage bullets;

PImage beeBullet;

PImage butter, logo;

//death X
var deathX;

var deathCount;

var typing = 0;

//variables for star movement
var starY1 = 59, starY2 = 50, starY3 = 359, starY4 = 151, starY5 = 210, starY6 = 250, starY7 = -30, starY8 = -50, starY9 = -80 ;

//varible for jupiter movement 
var jupiterY = 0;

//variable for sun
var sunY =  -1000;

//variables for ship
var shipX = 200;

//shoot variables
var shootX = 200;
var shootY = -1;

var shootX2 ;
var shootY2 ;


//bug variables 
var bugX = 50, bugY = 20;
var bugX2 = 100, bugY2 = 20;
var bugX3 = 150, bugY3 = 20;
var bugX4 = 200, bugY4 = 20;
var bugX5 = 250, bugY5 = 20;
var bugX6 = 300, bugY6 = 20;

var bugTime = 0;

//collision variables
var bugCollide1, bugCollide2, bugCollide3, bugCollide4, bugCollide5, bugCollide6;
var bugCollide7, bugCollide8, bugCollide9, bugCollide10, bugCollide11, bugCollide12;

//fly variables
var flyX = 200, flyY = -50;
var flyX2 = 100, flyY2 = -350;
var flyX3 = 300, flyY3 = -250;

//fly collision
var flyCollide1, flyCollide2, flyCollide3, flyCollide4, flyCollide5, flyCollide6, flyCollide7, flyCollide8, flyCollide9;

var bugTime2 = random(-400, 800), bugTime3 = random(-400, 800), bugTime4 = random(-400, 800);

//score
var score = 0;

//game over 
var gameOver = false, stop = false;

var flyDeath = false;
var flyDeath2 = false;
var flyDeath3 = false;

//bee bullets
var beeChoice;
var beeBulletsX;
var beeBulletsY;
var beeCount;
var beeOption = false;

//second bullet
var beeChoice2;
var beeBulletsX2;
var beeBulletsY2;
var beeOption2 = false;
var beeCount2 = 60;

//bee shot collisions 
var beeCollideShot;
var beeCollideShot2;

//lives
var lives = 2;

//fly bullets 
var flyChoice;
var flyBulletsX = 0;
var flyBulletsY = 0;
var flyOption;
var flyCount;
var flyOption = false;
var flyBulletCollide;


//title screen
var titleScreen = true;

//to count the deaths of the bugs 
var counter = 0;

//count levels 
var level = 2;

//timer
var levelTimer = 0;

//lightspeed
var lightSpeed = false;

//movement 
var right = false, left = false;

//logo movements
var logoX = 200;
var logoY = 170;
var logoMove = 0;

//title shoot 
var shootTime = 0;

//death animation
PImage death1;
PImage death2;
var explode = true;


//skybullets
var skyBulletY = random(-100,-5);
var skyBulletX = random(0,400);
var skyTimer = 0;
var skyCollide;

void setup() {



  //set size
  size(400, 500);

  //load images
  ship = loadImage("galaga_ship.png");
  bee = loadImage("bee.png");
  fly = loadImage("fly_bug.png");
  bullets = loadImage("bullets.png");
  beeBullet = loadImage("beeBullets.png");
  butter = loadImage("butterfly.png");
  logo = loadImage("logo.png");
  death1 = loadImage("Death_1.png");
  death1 = loadImage("Death_2.png");

  //center images 
  imageMode(CENTER);
  rectMode(CENTER);
}

//draw funciton
void draw() {
  //title screen 
  if (titleScreen == true) {

    background(0);


    //start timer
    typing ++;

    //set timer back 
    if (typing > 60) {
      typing = 0;
    }

    //display text
    //flash text
    if (typing > 30) {
      fill(255, 0, 0);//red
    }

    if (typing <= 30) {
      fill(0);
    }
    textSize(30);
    text("Press Enter to start", 70, 340);

    //start to move logo
    logoMove++;

    //move logo
    if (logoMove <= 60) {
      logoY += 0.2;
    } else {
      logoY -= 0.2;
    }

    if (logoMove > 120) {
      logoMove = 0;
    }

    //jupiter movement
    jupiterY = jupiterY + 0.5;

    //sun movement
    sunY = sunY + 0.2;

    //star Movents
    starY1 += 2;
    starY2 += 1.5;
    starY3 ++;
    starY4 += 1.2;
    starY5 += 2.2;
    starY6 ++;
    starY7 += 2.1;
    starY8 ++;
    starY9 += 2.6;

    //sun movement
    fill(255, 255, 0);//yellow
    ellipse(50, sunY, 150, 150);

    //draw jupiter
    fill(242, 133, 0);//orange
    ellipse(330, jupiterY, 60, 60);

    //stars
    fill(255, 255, 255);//white
    ellipse(50, starY1, 5, 5);

    ellipse(170, starY2, 5, 5);

    ellipse(360, starY3, 5, 5);

    ellipse(160, starY4, 5, 5);

    ellipse(249, starY5, 5, 5);

    ellipse(116, starY6, 5, 5);

    ellipse(90, starY7, 5, 5);

    ellipse(280, starY8, 5, 5);

    ellipse(390, starY9, 5, 5);


    //send star back to top 
    if (starY1 > 500 ) {
      starY1 = -50;
    }


    //send star2 back to top 
    if (starY2 > 500 ) {
      starY2 = -50;
    }

    //send star3 back to top 
    if (starY3 > 500 ) {
      starY3 = -50;
    }

    //send star4 back to top 
    if (starY4 > 500 ) {
      starY4 = -50;
    }

    //send star5 back to top 
    if (starY5 > 500 ) {
      starY5 = -50;
    }

    //send star6 back to top 
    if (starY6 > 500 ) {
      starY6 = -50;
    }

    //send star5 back to top 
    if (starY5 > 500 ) {
      starY5 = -50;
    }

    //send star6 back to top 
    if (starY6 > 500 ) {
      starY6 = -50;
    }

    //send star7 back to top 
    if (starY7 > 500 ) {
      starY7 = -50;
    }

    //send star8 back to top 
    if (starY8 > 500 ) {
      starY8 = -50;
    }

    //send star9 back to top 
    if (starY9 > 500 ) {
      starY9 = -50;
    }


    //send jupiter back to top
    if (jupiterY > 1000) {
      jupiterY = -1000;
    }

    //send sun back to top
    if (sunY > 1000) {
      sunY = -1000;
    }

    //display shoot
    image(bullets, shootX, shootY, 7, 11);

    //draw logo
    image(logo, logoX, logoY, 250, 170);

    //draw ship 
    image(ship, shipX, 470, 50, 55);

    //start timer 
    bugTime3++;

    if (bugTime3 > 800) {
      //randomize fly2 but for ship on title screen 
      bugTime3 = random(-400, 800);
    }

    if (bugTime3 > 400) {
      shipX++;
    } else {
      shipX--;
    }

    //turn ship around 
    if (shipX > 375) {
      bugTime3 = -200;
    }

    //turn ship around 
    if (shipX < 25) {
      bugTime3 = 500;
    }

    //reset timer
    if (shootTime == 801) {
      shootTime = -101;
    }

    //start timer 
    shootTime++;


    //if time is one of these then shoot 
    if (shootTime == 800 || shootTime == 0 || shootTime == -100 || shootTime == 369 || shootTime == 469 || shootTime == 650) {
      shootX = shipX;
      shootY = 460;
    }



    //move shoot
    shootY = shootY - 5;
  } else {
    //stop it 
    if (stop == false) {
      //run if gameOver is false
      if (gameOver == false) {

        //set background to black 
        background(0);

        //move the ship 
        if (left == true) {
          shipX = shipX - 3;
        }
        if (right == true) {
          shipX = shipX + 3;
        }

        //Jordan Was Here
        if (lightSpeed == false) {
          //star Movements
          starY1 += 2;
          starY2 += 1.5;
          starY3 ++;
          starY4 += 1.2;
          starY5 += 2.2;
          starY6 ++;
          starY7 += 2.1;
          starY8 ++;
          starY9 += 2.6;
        } else {
          //star Movents
          starY1 += 8;
          starY2 += 8.5;
          starY3 += 9;
          starY4 += 7.2;
          starY5 += 9.2;
          starY6 += 7.9;
          starY7 += 9.1;
          starY8 += 8;
          starY9 += 7.6;
          //boost score 
          score++;
        }



        //start bugTime
        bugTime++;
        bugTime2++;
        bugTime3++;
        bugTime4++;

        //start bee count 
        beeCount++;
        beeCount2++;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    

        //start timer 
        levelTimer++;

        //reset
        if (levelTimer > 301) {
          levelTimer = 0;
        }

        //reset bee count 
        if (beeCount > 190 ) {
          beeCount = 0;
        }

        //reset bee count 
        if (beeCount2 > 190 ) {
          beeCount2 = 0;
        }

if(level >= 3){
 //chose a fly to shoot from 
        if (flyCount == 190 ) {
          flyChoice = random(-1, 3);
          flyOption = true;
        }

        if (flyOption == true) {
          //choose x values

          //set X and Y values
          if (flyChoice < 1) {
            flyBulletsX = flyX;
            flyBulletsY = flyY;

            //stop teleporting it to position 
            flyOption = false;
          }


          //set X and Y values
          if (flyChoice > 1 && flyChoice < 2) {
            flyBulletsX = flyX2;
            flyBulletsY = flyY2;
            //stop teleporting it to position 
            flyOption = false;
          }


          //set X and Y values
          if (flyChoice > 2 && flyChoice < 3) {
            flyBulletsX = flyX3;
            flyBulletsY = flyY3;
            //stop teleporting it to position 
            flyOption = false;
          }
        }
        

//timer reset
         if(flyCount == 200){
           flyCount = 0;
         }
         
         //timer goes
         flyCount++;
         
         //shoot down
         flyBulletsY += 4;
         
         
         
        
}

  

        //chose a bee to shoot from 
        if (beeCount == 190 ) {
          beeChoice = random(-1, 6);
          beeOption = true;
        }

        if (beeOption == true) {
          //choose x values

          //set X and Y values
          if (beeChoice < 1) {
            beeBulletsX = bugX;
            beeBulletsY = bugY;

            //stop teleporting it to position 
            beeOption = false;
          }


          //set X and Y values
          if (beeChoice > 1 && beeChoice < 2) {
            beeBulletsX = bugX2;
            beeBulletsY = bugY2;
            //stop teleporting it to position 
            beeOption = false;
          }


          //set X and Y values
          if (beeChoice > 2 && beeChoice < 3) {
            beeBulletsX = bugX3;
            beeBulletsY = bugY3;
            //stop teleporting it to position 
            beeOption = false;
          }


          //set X and Y values
          if (beeChoice > 3 && beeChoice < 4) {
            beeBulletsX = bugX4;
            beeBulletsY = bugY4;
            //stop teleporting it to position 
            beeOption = false;
          }


          //set X and Y values
          if (beeChoice > 4 && beeChoice < 5) {
            beeBulletsX = bugX5;
            beeBulletsY = bugY5;
            //stop teleporting it to position 
            beeOption = false;
          }

          //set X and Y values
          if (beeChoice > 5) {
            beeBulletsX = bugX6;
            beeBulletsY = bugY6;
            //stop teleporting it to position 
            beeOption = false;
          }
        }


        //move second bullet
        beeBulletsY2 = beeBulletsY2 + 5;

        //second bullet


        //chose a bee to shoot from 
        if (beeCount2 == 190 ) {
          beeChoice2 = random(-1, 6);
          beeOption2 = true;
        }

        if (beeOption2 == true) {
          //set X and Y values
          if (beeChoice2 < 1) {
            beeBulletsX2 = bugX;
            beeBulletsY2 = bugY;

            //stop teleporting it to position 
            beeOption2 = false;
          }


          //set X and Y values
          if (beeChoice2 > 1 && beeChoice2 < 2) {
            beeBulletsX2 = bugX2;
            beeBulletsY2 = bugY2;
            //stop teleporting it to position 
            beeOption2 = false;
          }


          //set X and Y values
          if (beeChoice2 > 2 && beeChoice2 < 3) {
            beeBulletsX2 = bugX3;
            beeBulletsY2 = bugY3;
            //stop teleporting it to position 
            beeOption2 = false;
          }


          //set X and Y values
          if (beeChoice2 > 3 && beeChoice2 < 4) {
            beeBulletsX2 = bugX4;
            beeBulletsY2 = bugY4;
            //stop teleporting it to position 
            beeOption2 = false;
          }


          //set X and Y values
          if (beeChoice2 > 4 && beeChoice2 < 5) {
            beeBulletsX2 = bugX5;
            beeBulletsY2 = bugY5;
            //stop teleporting it to position 
            beeOption2 = false;
          }

          //set X and Y values
          if (beeChoice2 > 5) {
            beeBulletsX2 = bugX6;
            beeBulletsY2 = bugY6;
            //stop teleporting it to position 
            beeOption2 = false;
          }
        }



        if (lightSpeed == false) {
          //jupiter movement
          jupiterY = jupiterY + 0.5;

          //sun movement
          sunY = sunY + 0.2;
        } else {
          //jupiter movement
          jupiterY = jupiterY + 5.5;

          //sun movement
          sunY = sunY + 4;
        }
        //sun movement
        fill(255, 255, 0);//yellow
        ellipse(50, sunY, 150, 150);

        //draw jupiter
        fill(242, 133, 0);//orange
        ellipse(330, jupiterY, 60, 60);

        //stars
        fill(255, 255, 255);//white
        ellipse(50, starY1, 5, 5);

        ellipse(170, starY2, 5, 5);

        ellipse(360, starY3, 5, 5);

        ellipse(160, starY4, 5, 5);

        ellipse(249, starY5, 5, 5);

        ellipse(116, starY6, 5, 5);

        ellipse(90, starY7, 5, 5);

        ellipse(280, starY8, 5, 5);

        ellipse(390, starY9, 5, 5);


        //send star1 back to top 
        if (starY1 > 500 ) {
          starY1 = -50;
        }


        //send star2 back to top 
        if (starY2 > 500 ) {
          starY2 = -50;
        }

        //send star3 back to top 
        if (starY3 > 500 ) {
          starY3 = -50;
        }

        //send star4 back to top 
        if (starY4 > 500 ) {
          starY4 = -50;
        }

        //send star5 back to top 
        if (starY5 > 500 ) {
          starY5 = -50;
        }

        //send star6 back to top 
        if (starY6 > 500 ) {
          starY6 = -50;
        }

        //send star5 back to top 
        if (starY5 > 500 ) {
          starY5 = -50;
        }

        //send star6 back to top 
        if (starY6 > 500 ) {
          starY6 = -50;
        }

        //send star7 back to top 
        if (starY7 > 500 ) {
          starY7 = -50;
        }

        //send star8 back to top 
        if (starY8 > 500 ) {
          starY8 = -50;
        }

        //send star9 back to top 
        if (starY9 > 500 ) {
          starY9 = -50;
        }


        //send jupiter back to top
        if (jupiterY > 1000) {
          jupiterY = -1000;
        }

        //send sun back to top
        if (sunY > 1000) {
          sunY = -1000;
        }


        //draw lives
        if (lives >= 1) {
          image(ship, 380, 480, 30, 35);
        }

        if (lives >= 2) {
          image(ship, 350, 480, 30, 35);
        }



        //keep ship on screen
        if (shipX > 400) {
          shipX = shipX - 3;
        }

        //keep ship on screen
        if (shipX < 0) {
          shipX = shipX + 3;
        }


        fill(255, 255, 255);//white

        //draw shoot
        image(bullets, shootX, shootY, 7, 11);

if(level > 3){
     //draw fly shoot
        image(beeBullet, flyBulletsX, flyBulletsY, 7, 11);
}

        //move shoot
        shootY = shootY - 5;



        //draw shoot 2
        image(bullets, shootX2, shootY2, 7, 11);

        //move shoot
        shootY2 = shootY2 - 5;


        //bug 1
        image(bee, bugX, bugY, 25, 25);

        //bug 2
        image(butter, bugX2, bugY2, 25, 25);

        //bug 3
        image(bee, bugX3, bugY3, 25, 25);

        //bug 4
        image(bee, bugX4, bugY4, 25, 25);

        //bug 5
        image(butter, bugX5, bugY5, 25, 25);

        //bug 6
        image(bee, bugX6, bugY6, 25, 25);






        //move bugs around 
        bugMove();

        if (flyDeath ==  false) {

          //display fly
          image(fly, flyX, flyY, 40, 40);


          //turn fly around 
          if (flyX > 400) {
            bugTime2 = -400;
          }

          //turn fly around 
          if (flyX < 0) {
            bugTime2 = 400;
          }

          //move fly
          flyY = flyY + 2.5;

          if (bugTime2 > 400 || flyX < 0) {
            //move right
            flyX = flyX + 0.3;
          } else {
            //move left
            flyX = flyX - 0.3;
          }


          if (bugTime2 > 800) {
            //randomize fly movement 
            bugTime2 = random(-400, 800);
          }

          //send fly back to top
          if (flyY > 510) {
            flyY = random(-550, -50);
          }
        }

        if (flyDeath2 ==  false) {
          //fly 2
          //display fly2
          image(fly, flyX2, flyY2, 40, 40);

          //move fly2
          flyY2 = flyY2 + 2.1;

          //send fly2 back to top
          if (flyY2 > 510) {
            flyY2 = random(-550, -50);
          }

          if (bugTime3 > 800) {
            //randomize fly2 movement 
            bugTime3 = random(-400, 800);
          }

          if (bugTime3 > 400 || flyX2 < 0) {
            //move right
            flyX2 = flyX2 + 0.2;
          } else {
            //move left
            flyX2 = flyX2 - 0.2;
          }

          //turn fly2 around 
          if (flyX2 > 400) {
            bugTime3 = -400;
          }

          //turn fly2 around 
          if (flyX2 < 0) {
            bugTime3 = 400;
          }
        }

        if (flyDeath3 ==  false) {
          //fly 3
          //display fly3
          image(fly, flyX3, flyY3, 40, 40);

          //move fly3
          flyY3 = flyY3 + 1.7;

          //send fly2 back to top
          if (flyY3 > 510) {
            flyY3 = random(-550, -50);
          }

          if (bugTime4 > 800) {
            //randomize fly2 movement 
            bugTime4 = random(-400, 800);
          }

          if (bugTime4 > 400 || flyX3 < 0) {
            //move right
            flyX3 = flyX3 + 0.5;
          } else {
            //move left
            flyX3 = flyX3 - 0.5;
          }

          //turn fly3 around 
          if (flyX3 > 400) {
            bugTime4 = -400;
          }

          //turn fly3 around 
          if (flyX3 < 0) {
            bugTime4 = 400;
          }
        }




if(lightSpeed == false){
if(level > 2 ){
  //set X value
  if(skyTimer == 190){
    skyBulletX = random(0,400);
     skyBulletY = random(-100,-5);
  }
  
  //reset sky timer 
  if(skyTimer == 191){
  skyTimer = 0;
  }
  
  //move the bullet
  skyBulletY += 5;
  
  //start timer
  skyTimer++;
  
  //display sky bullet
  image(beeBullet,skyBulletX,skyBulletY,7,11);

}

}





      

        //draw bug shots 
        image(beeBullet, beeBulletsX, beeBulletsY, 7, 11);

        //move bullets
        beeBulletsY = beeBulletsY + 5;


        //draw bug2 shots 
        image(beeBullet, beeBulletsX2, beeBulletsY2, 7, 11);



        //bee shots 
        beeCollideShot = dist(beeBulletsX, beeBulletsY, shipX, 470);
        beeCollideShot2 = dist(beeBulletsX2, beeBulletsY2, shipX, 470);
        flyBulletCollide  = dist(flyBulletsX, flyBulletsY, shipX, 470);
        skyCollide = dist(skyBulletX, skyBulletY, shipX, 470);

        //fly1 to bullets
        flyCollide1 = dist(flyX, flyY, shootX, shootY);
        flyCollide2 = dist(flyX, flyY, shootX2, shootY2);
        flyCollide3 = dist(flyX, flyY, shipX, 470);

        //fly2 to bullets 
        flyCollide4 = dist(flyX2, flyY2, shootX, shootY);
        flyCollide5 = dist(flyX2, flyY2, shootX2, shootY2);
        flyCollide6 = dist(flyX2, flyY2, shipX, 470);

        //fly3 to bullets 
        flyCollide7 = dist(flyX3, flyY3, shootX, shootY);
        flyCollide8 = dist(flyX3, flyY3, shootX2, shootY2);
        flyCollide9 = dist(flyX3, flyY3, shipX, 470);

        //colisions 
        //bug1 to bullets
        bugCollide1 = dist(bugX, bugY, shootX, shootY);
        bugCollide2 = dist(bugX, bugY, shootX2, shootY2);

        //bug2 to bullets
        bugCollide3 = dist(bugX2, bugY2, shootX, shootY);
        bugCollide4 = dist(bugX2, bugY2, shootX2, shootY2);

        //bug3 to bullets
        bugCollide5 = dist(bugX3, bugY3, shootX, shootY);
        bugCollide6 = dist(bugX3, bugY3, shootX2, shootY2);

        //bug4 to bullets
        bugCollide7 = dist(bugX4, bugY4, shootX, shootY);
        bugCollide8 = dist(bugX4, bugY4, shootX2, shootY2);

        //bug5 to bullets
        bugCollide9 = dist(bugX5, bugY5, shootX, shootY);
        bugCollide10 = dist(bugX5, bugY5, shootX2, shootY2);

        //bug6 to bullets
        bugCollide11 = dist(bugX6, bugY6, shootX, shootY);
        bugCollide12 = dist(bugX6, bugY6, shootX2, shootY2);


        //if shoot1 hits bug 1
        if (bugCollide1 < 13) {
          //send bullet and bug away
          bugX = 1000;
          shootY = -1000;
          //add 1 to score
          score+= 100;
          //add to counter 
          counter++;
          //set timer to 0
          levelTimer = 0;
        }

        if (bugCollide2 < 13) {
          //send bullet and bug away
          bugX = 1000;
          shootY2 = -1000;
          //add 1 to score
          score+= 100;
          //add to counter 
          counter++;
          //set timer to 0
          levelTimer = 0;
        }

        //if shoot1 hits bug 2
        if (bugCollide3 < 13) {
          //send bullet and bug away
          bugX2 = 1000;
          shootY = -1000;
          //add 1 to score
          score+= 100;
          //add to counter 
          counter++;
          //set timer to 0
          levelTimer = 0;
        }

        if (bugCollide4 < 13) {
          //send bullet and bug away
          bugX2 = 1000;
          shootY2 = -1000;
          //add 1 to score
          score+= 100;
          //add to counter 
          counter++;
          //set timer to 0
          levelTimer = 0;
        }

        //if shoot1 hits bug 3
        if (bugCollide5 < 13) {
          //send bullet and bug away
          bugX3 = 1000;
          shootY = -1000;
          //add 1 to score
          score+= 100;
          //add to counter 
          counter++;
          //set timer to 0
          levelTimer = 0;
        }

        if (bugCollide6 < 13) {
          //send bullet and bug away
          bugX3 = 1000;
          shootY2 = -1000;
          //add 1 to score
          score+= 100;
          //add to counter 
          counter++;
          //set timer to 0
          levelTimer = 0;
        }

        //if shoot1 hits bug 4
        if (bugCollide7 < 13) {
          //send bullet and bug away
          bugX4 = 1000;
          shootY = -1000;
          //add 1 to score
          score+= 100;
          //add to counter 
          counter++;
          //set timer to 0
          levelTimer = 0;
        }

        if (bugCollide8 < 13) {
          //send bullet and bug away
          bugX4 = 1000;
          shootY2 = -1000;
          //add 1 to score
          score+= 100;
          //add to counter 
          counter++;
          //set timer to 0
          levelTimer = 0;
        }

        //if shoot1 hits bug 5
        if (bugCollide9 < 13) {
          //send bullet and bug away
          bugX5 = 1000;
          shootY = -1000;
          //add 1 to score
          score+= 100;
          //add to counter 
          counter++;
          //set timer to 0
          levelTimer = 0;
        }

        if (bugCollide10 < 13) {
          //send bullet and bug away
          bugX5 = 1000;
          shootY2 = -1000;
          //add 1 to score
          score+= 100;
          //add to counter 
          counter++;
          //set timer to 0
          levelTimer = 0;
        }

        //if shoot1 hits bug 6
        if (bugCollide11 < 13) {
          //send bullet and bug away
          bugX6 = 1000;
          shootY = -1000;
          //add 1 to score
          score+= 100;
          //add to counter 
          counter++;
          //set timer to 0
          levelTimer = 0;
        }

        if (bugCollide12 < 13) {
          //send bullet and bug away
          bugX6 = 1000;
          shootY2 = -1000;
          //add 1 to score
          score+= 100;
          //add to counter 
          counter++;
          //set timer to 0
          levelTimer = 0;
        }

        //fly collisions 
        if (flyCollide1 < 13) {
          //send bullet and bug away
          flyX = 1000;
          //move bullet
          shootY = -1000;
          //add 1 to score
          score+= 100;
          //get off screen
          flyDeath = true;
          //add to counter 
          counter++;
          //set timer to 0
          levelTimer = 0;
        }

        if (flyCollide2 < 13) {
          //send bullet and bug away
          flyX = 1000;
          //move bullet
          shootY2 = -10000;
          //add 1 to score
          score+= 100;
          //get off screen
          flyDeath = true;
          //add to counter 
          counter++;
          //set timer to 0
          levelTimer = 0;
        }

        if (flyCollide4 < 13) {
          //send bullet and bug away
          flyX2 = 1000;
          //move bullet
          shootY = -10000;
          //add 1 to score
          score+= 100;
          //get off screen
          flyDeath2 = true;
          //add to counter 
          counter++;
          //set timer to 0
          levelTimer = 0;
        }

        if (flyCollide5 < 13) {
          //send bullet and bug away
          flyX2 = 1000;
          //move bullet
          shootY2 = -10000;
          //add 1 to score
          score+= 100;
          //get off screen
          flyDeath2 = true;
          //add to counter 
          counter++;
          //set timer to 0
          levelTimer = 0;
        }

        if (flyCollide7 < 13) {
          //send bullet and bug away
          flyX3 = 1000;
          //move bullet
          shootY = -10000;
          //add 1 to score
          score+= 100;
          //get off screen
          flyDeath3 = true;
          //add to counter 
          counter++;
          //set timer to 0
          levelTimer = 0;
        }

        if (flyCollide8 < 13) {
          //send bullet and bug away
          flyX3 = 1000;
          //move bullet
          shootY2 = -10000;
          //add 1 to score
          score+= 100;
          //get off screen
          flyDeath3 = true;
          //add to counter 
          counter++;
          //set timer to 0
          levelTimer = 0;
        }




        //death collisions 
        if (flyCollide3 < 30) {
          if (lives == 0) {
            endGame();
          } else {
            death();
          }
        }

        //death collisions 
        if (flyCollide6 < 30) {
          if (lives == 0) {
            endGame();
          } else {
            death();
          }
        }

        //death collisions 
        if (flyCollide9 < 30) {
          if (lives == 0) {
            endGame();
          } else {
            death();
          }
        }





        //bee shot hitting ship 
        if (beeCollideShot < 25) {
          if (lives == 0) {
            endGame();
          } else {
            death();
          }
        }

        if (beeCollideShot2 < 25) {
          if (lives == 0) {
            endGame();
          } else {
            death();
          }
        }
        
         //fly shot hitting ship 
        if (flyBulletCollide < 25) {
          if (lives == 0) {
            endGame();
          } else {
            death();
          }
        }
        
        //sky shot hitting ship 
        if (skyCollide < 25) {
          if (lives == 0) {
            endGame();
          } else {
            death();
          }
        }



        //display score
        fill(255, 0, 0);//red
        textSize(20);
        text("score: " + score, 280, 20);


        //draw ship
        image(ship, shipX, 470);


        //check if all the bugs and flys are dead 
        if (counter == 9) {

          bugBulletsX = 5000;
          bugBulletsX2 = 5000;

          if (levelTimer < 300) {
            fill(255, 0, 0);//red
            textSize(40);
            //display level
            text("level " + level, 140, 230);

            lightSpeed = true;
          } else {

            //add 1 to level 
            level++;

            counter = 0;


            //move all the bugs back 
            bugX = 50;
            bugX2 = 100;
            bugX3 = 150;
            bugX4 = 200;
            bugX5 = 250;
            bugX6 = 300;
            bugY = 20;
            bugY2 = 20;
            bugY3 = 20;
            bugY4 = 20;
            bugY5 = 20;
            bugY6 = 20;
            //move fly X's back 
            flyX = 205;
            flyX2 = random(1, 400);
            flyX3 = random(1, 400);

            //move fly Y's back
            flyY = random(-50, -550);
            flyY2 = random(-50, -550);
            flyY3 = random(-50, -550);

            skyBulletX = 10000;
         
      
            flyBulletsX = 10000;



            //reset timer
            bugTime = 0;



            //bring flies back
            flyDeath = false;
            flyDeath2 = false;
            flyDeath3 = false;

            //stop light speed
            lightSpeed = false;

            //any bullets on screen take off
            shootY = -1000;
            shootY2 = -1000;
          }
        }
      }
    }
  }
};



void keyPressed() {
  if (keyCode == ENTER) {

    if (titleScreen == true) {
      //set score to 0
      score = 0;

      //move all the bugs back 
      bugX = 50;
      bugX2 = 100;
      bugX3 = 150;
      bugX4 = 200;
      bugX5 = 250;
      bugX6 = 300;
      bugY = 20;
      bugY2 = 20;
      bugY3 = 20;
      bugY4 = 20;
      bugY5 = 20;
      bugY6 = 20;
      //move fly X's back 
      flyX = random(1, 400);
      flyX2 = random(1, 400);
      flyX3 = random(1, 400);

      //move fly Y's back
      flyY = random(-50, -550);
      flyY2 = random(-50, -550);
      flyY3 = random(-50, -550);

      shootY = -1000;
      shootY2 = -1000;

      //bee bullet disapear 
      beeBulletsY = 560;
      beeBulletsY2 = 560;
      
      skyBulletX = random(0,400);
      skyBulletY = random(-100,-5);
      
      flyBulletsX = 10000;

      //reset lives 
      lives = 2;

      //reset timer
      bugTime = 0;



      //bring flies back
      flyDeath = false;
      flyDeath2 = false;
      flyDeath3 = false;

      //set counter back
      counter = 0;

      //set level back 
      level = 2; 

      //move ship back
      shipX = 200;

      //start game 
      titleScreen = false;
      stop = false;
    } 



    //if game is over and they want to go to title screen
    if (stop == true) {
      titleScreen = true;
    }
  }

  if (gameOver == true) {
    if (keyCode == ENTER) {



      //if any bullets are fired reset them
      shootY = -1000;
      shootY2 = -1000;

      //bee bullet disapear 
      beeBulletsY = 560;
      beeBulletsY2 = 560;

      //take away a life
      lives--;

      //start game 
      gameOver = false;

      //move ship back
      shipX = 200;

      //send flies back
      flyY = random(-50, -300);
      flyY2 = random(-50, -300);
      flyY3 = random(-50, -300);
      //reset 
      
       skyBulletX = 10000;
      
      
      flyBulletsX = 10000;

    }
  }


  //move ship
  if (key == CODED) {



    //if left arrow is clicked
    if (keyCode == LEFT) {

      //left
      left = true;
    }

    //if right arrow is clicked
    if (keyCode == RIGHT) {

      //left
      right = true;
    }

    //if up arrow is clicked shoot
    if (keyCode == UP) {

      //only shoot if off screen
      if (shootY < 0) {

        //shoot 1
        shootX = shipX;

        shootY = 450;
      }

      //only shoot if off screen
      if (shootY2 < 0) {

        //only shoot if the first one is high enough
        if (shootY < 200) {

          //shoot 2
          shootX2 = shipX;

          shootY2 = 450;

          //change x pos after off screen 
          if (shootY < 0) {
            shootX = 800;
          }

          if (shootY2 < 0) {
            shootX2 = 800;
          }
        }
      }
    }
  }
}



void bugMove() {

  //move the bugs in a pattern
  if (bugTime < 60) {
    //move up
    bugX++;
    bugY++;
    bugX2++;
    bugY2++;
    bugX3++;
    bugY3++;
    bugX4++;
    bugY4++;
    bugX5++;
    bugY5++;
    bugX6++;
    bugY6++;
  } else if (bugTime > 60 && bugTime < 120) {
    //move down and right
    bugY--;
    bugY2--;
    bugY3--;
    bugY4--;
    bugY5--;
    bugY6--;
  } else if (bugTime > 120 && bugTime < 180) {
    //move left and down
    bugX--;
    bugY++;
    bugX2--;
    bugY2++;
    bugX3--;
    bugY3++;
    bugX4--;
    bugY4++;
    bugX5--;
    bugY5++;
    bugX6--;
    bugY6++;
  } else if (bugTime > 180 && bugTime < 240) {
    //move up
    bugY--;
    bugY2--;
    bugY3--;
    bugY4--;
    bugY5--;
    bugY6--;
  }

  if (bugTime > 240) {
    bugTime = 0;
  }
}


void death() {


  


  deathX = shipX;

  shipX = 467;




  image(death1, deathX, 470, 55, 55);



  textSize(40);

  fill(255, 0, 0);//red

  //tell them they died 
  text("You Died!", 105, 250); 

  text("Click Enter", 95, 290); 

  //stop game 
  gameOver = true;
} 

void endGame() {

  //move death
  deathX = shipX;

  //move ship
  shipX = 467;

  image(death1, deathX, 470, 55, 55);


  //change size 
  textSize(40);

  fill(255, 0, 0);//red

  //display game over 
  text("Game Over", 100, 250);

  stop = true;
}

void keyReleased() {

  //move ship
  if (key == CODED) {

    //if left arrow is clicked
    if (keyCode == LEFT) {

      //left
      left = false;
    }

    //if right arrow is clicked
    if (keyCode == RIGHT) {

      //left
      right = false;
    }
  }
}

