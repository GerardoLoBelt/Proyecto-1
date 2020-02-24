//HEAD

PantallaInicio pantallainicio;
PantallaEscogerPersonaje fondito;
PantallaBatalla batalla;
PantallaGanador ganador;
Tae taes; Min mins; Jon jons; Key keys; One ones;

int estado;
int estado1 = 0; //INICIO
int estado2 = 1; //ESCOGER PERSONAJES
int estado3 = 2; //BATALLA
int estado4 = 3; //GANADOR
int contador=0;

void setup() {
  size(800, 500);
  pantallainicio = new PantallaInicio(); 
  estado = estado1; 
fondito = new PantallaEscogerPersonaje();
taes = new Tae(110,320,90,#0D80FF);
mins = new Min (250,320,90,#0CAEE8);
jons = new Jon (390,320,90,#00FFFD); 
keys = new Key (530,320,90,#0CE8AA);
ones = new One (670,320,90,#0DFF76);
  batalla = new PantallaBatalla();
  ganador = new PantallaGanador();
}

void draw() {
  
  // Esta es la pantalla de inicio, cuando presione ENTER iniciara el juego
  if ( estado == estado1) {
    pantallainicio.displayPantallaInicio();
    if (keyCode == ENTER) {
      estado = estado2;}}
      
  // Esta es la pantalla para ESCOGER PERSONAJE...
  // Cuando seleccione el jugador 2 a su personjae lo mandara
  // a la pantalla de Batalla
  if (estado == estado2) {
    fondito.displayEscogerPersonajes();
    taes.displayTae();
    mins.displayMin();
    jons.displayJon();
    keys.displayKey();
    ones.displayOne();    
    mouseClicked();}
    
  // Esta es para la pantalla de BATALLA
  if ( estado == estado3) {
    batalla.pelea();
    
  //Esta es para cuando uno pierda y se vaya a la pantalla de Ganador
    if (batalla.vida1 <= 0 || batalla.vida2 <= 0) {estado = estado4;}}
      
  // Esta es para la pantalla de GANADOR
  if (estado == estado4){
  ganador.displayPantallaGanador();  
  fill(225,227,84);
  textSize(30);
  text("Reiniciar Juego", 505, 385);
  if(mouseX>500&&mouseX<730&&mouseY>340&&mouseY<570&&mouseButton==LEFT){estado=0;//setup();
}
}
  
}

void mouseClicked() {

if (estado==estado2&&(mouseButton == LEFT &&(mouseX>80&&mouseX<205&&mouseY>280&&mouseY<370))){contador=2;
     if (contador==2){estado=estado3;}}
if (estado==estado2&&(mouseButton == LEFT &&(mouseX>220&&mouseX<345&&mouseY>280&&mouseY<370))){contador=2;
     if (contador==2){estado=estado3;}}   
if (estado==estado2&&(mouseButton == LEFT &&(mouseX>360&&mouseX<485&&mouseY>280&&mouseY<370))){contador=2;
     if (contador==2){estado=estado3;}}
if (estado==estado2&&(mouseButton == LEFT &&(mouseX>500&&mouseX<625&&mouseY>280&&mouseY<370))){contador=2;
     if (contador==2){estado=estado3;}}  
if (estado==estado2&&(mouseButton == LEFT &&(mouseX>640&&mouseX<765&&mouseY>280&&mouseY<370))){contador=2;
     if (contador==2){estado=estado3;}} 
 }
 
 class PantallaInicio { 

void displayPantallaInicio() { 
  background(255,135,226);
  noStroke();
  textSize(64);
  fill(#D95B66);
  text("EL REY DE", 230, 110); 
  text("LA ROCA", 250, 174); 
  fill(#097CBA);
  textSize(32);
  text("presiona ENTER para iniciar el juego", 140, 410); 
  fill(#FFFFFF);}
  
}

class PantallaEscogerPersonaje { 

  void displayEscogerPersonajes(){
  background(255,135,226);
  noStroke();
  fill(225,227,84);
  rect(0, 300, 800, 300);
  textSize(64);
  fill(#D95B66);
  text("Elije a tu personaje", 115, 110);
}
}

class PantallaBatalla { 
  
  float ataque1, ataque2;
  int vida1, vida2; 
  boolean turno;  
  int recuperacion; 
  
  PantallaBatalla() {
    turno = true; 
    vida1 = 100; 
    vida2 = 100; 
    recuperacion = 5; 
  }

void pelea() { 

  background(255,135,226);
  noStroke();
  fill(225,227,84);
  rect(0, 300, 800, 300);
  textSize(64);
  fill(#D95B66);
  text("BATALLA", 235, 70);
  
    ataque(); 
    Jugador1();
    Jugador2();
    Instrucciones1();
    Instrucciones2();
    keyPressed();
    Turno();
  }

  void ataque() {
    ataque1 = random(3, 7); 
    ataque2 = random(0, 10);
  }

  void Jugador1() {     
    textSize(50); 
    fill(#D95B66); 
    text(vida2, width/1.7, height/1.8);
    }

  void Jugador2() { 
    textSize(50); 
    fill(#D95B66); 
    text(vida1, width/14, height/1.8);
    }

  void Instrucciones1() {
    textSize(20); 
    text("Presiona", width/20, height/1.3); 
    text("1 = Atacar", width/15, height/1.21);
    text("2 = Ataque Especial", width/15, height/1.12);
    text("3 = Recuperacion", width/15, height/1.05);}

  void Instrucciones2() {
    text("Presiona", width/1.8, height/1.3);
    text("7 = Atacar", width/1.8, height/1.21);
    text("8 = Ataque Especial", width/1.8, height/1.12);
    text("9 = Recuperacion", width/1.8, height/1.05);}

  void Turno() {
    textSize(30); 
    if (key == '7' || key == '8' || key == '9') {
      text("TURNO: Jugador 2", width/15, height/1.54);}
    else {
      text("TURNO: Jugador 1", width/1.65, height/1.54);}}

  void keyPressed() {

    if (turno == true) { 
      if (key == '7') {
        batalla.vida1 = int(batalla.vida1 - batalla.ataque1);
        if (batalla.vida1 <= 0){
          batalla.vida1 = 0;}
      }
      if (key == '8') {
        batalla.vida1 = int(batalla.vida1 - batalla.ataque2);
        if (batalla.vida1 < 0) {
          batalla.vida1 = 0;}
      }
      if (key == '9') {
        batalla.vida2 = batalla.vida2 + batalla.recuperacion;
        if ( batalla.vida2 > 100)
          batalla.vida2 = 100;
      }
    }

    if (key == '7' || key == '8' || key == '9') {turno = false;}

    if (turno == false) { 
      if (key == '1') {
        batalla.vida2 = int(batalla.vida2 - batalla.ataque1);
       if (batalla.vida2 <= 0) { 
          batalla.vida2 = 0;}
      }
      if (key == '2') {
        batalla.vida2 = int(batalla.vida2 - batalla.ataque2);
        if (batalla.vida2 < 0) { 
          batalla.vida2 = 0;
        }
      }
      if (key == '3') {
        batalla.vida1 = batalla.vida1 + batalla.recuperacion;
        if ( batalla.vida1 > 100)
          batalla.vida1 = 100;
      }

      if (key == '1' || key =='2' || key == '3')
        turno = true;
    }
  }
}

class PantallaGanador{
  
  void displayPantallaGanador() { 
   background(255,135,226);
  noStroke();
  fill(225,227,84);
  rect(0, 300, 800, 300);
  textSize(64);
  fill(#D95B66);
  text("GANADOR", 440, 110);
  rect(500,340,230,70);
  fill(225,227,84);
  textSize(30);
  text("Reiniciar Juego", 505, 385);
}
}

class Tae{
  float PosicionX, PosicionY, Tamano;
  color Color;
  
Tae(float PosicionX_,float PosicionY_,float Tamano_, color Color_){
  PosicionX=PosicionX_;
  PosicionY=PosicionY_;
  Tamano=Tamano_;
  Color=Color_;}

void displayTae(){
  float Dis= dist(mouseX,mouseY,PosicionX,PosicionY);
  float T;
  
if(estado == estado2){
   T= 100;
   ellipseMode(CENTER);
   fill(Color);
   ellipse(PosicionX,PosicionY,T,T);
   fill(#ffffff);
   ellipse(PosicionX-T/4,PosicionY-T/4,T/2.5,T/2.5);
   ellipse(PosicionX+T/4,PosicionY-T/4,T/2.5,T/2.5);
 if(Dis<Tamano/2){T = 110;
   fill(Color);
   ellipse(PosicionX,PosicionY,T,T);
   fill(#ffffff);
   ellipse(PosicionX-T/4,PosicionY-T/4,T/2.5,T/2.5);
   ellipse(PosicionX+T/4,PosicionY-T/4,T/2.5,T/2.5);
 if(mouseX>80&&mouseX<205&&mouseY>280&&mouseY<370){textSize(25);
  fill(#D95B66);
  text ("Qing-long:",45,425); text ("Representa el elemento de la Madera",45,450); 
  text ("Su criatura celestial es el Dragon Azul",105.5,475);}
   }
}
  
}

}

class Min{
  float PosicionX, PosicionY, Tamano;
  color Color;
  
Min(float PosicionX_,float PosicionY_,float Tamano_, color Color_){
  PosicionX=PosicionX_;
  PosicionY=PosicionY_;
  Tamano=Tamano_;
  Color=Color_;}

void displayMin(){
  float Dis= dist(mouseX,mouseY,PosicionX,PosicionY);
  float T;
  
if(estado == estado2){
   T= 100;
   ellipseMode(CENTER);
   fill(Color);
   ellipse(PosicionX,PosicionY,T,T);
   fill(#ffffff);
   ellipse(PosicionX-T/4,PosicionY-T/4,T/2.5,T/2.5);
   ellipse(PosicionX+T/4,PosicionY-T/4,T/2.5,T/2.5);
 if(Dis<Tamano/2){T = 110;
   fill(Color);
   ellipse(PosicionX,PosicionY,T,T);
   fill(#ffffff);
   ellipse(PosicionX-T/4,PosicionY-T/4,T/2.5,T/2.5);
   ellipse(PosicionX+T/4,PosicionY-T/4,T/2.5,T/2.5);
 if (mouseX>220&&mouseX<345&&mouseY>280&&mouseY<370){textSize(25);
  fill(#D95B66);
text ("Zhu-que :",45,425); text ("Representa el elemento del Fuego",45,450);
text ("Su criatura celestial es el Fenix Rojo",105.5,475);}
   }
}
  
}

}

class Jon{
  float PosicionX, PosicionY, Tamano;
  color Color;
  int ApareceEnBatalla1;
  
Jon(float PosicionX_,float PosicionY_,float Tamano_, color Color_){
  PosicionX=PosicionX_;
  PosicionY=PosicionY_;
  Tamano=Tamano_;
  Color=Color_;}

void displayJon(){
  float Dis= dist(mouseX,mouseY,PosicionX,PosicionY);
  float T;
  
if(estado == estado2){
   T= 100;
   ellipseMode(CENTER);
   fill(Color);
   ellipse(PosicionX,PosicionY,T,T);
   fill(#ffffff);
   ellipse(PosicionX-T/4,PosicionY-T/4,T/2.5,T/2.5);
   ellipse(PosicionX+T/4,PosicionY-T/4,T/2.5,T/2.5);
 if(Dis<Tamano/2){T = 110;
   fill(Color);
   ellipse(PosicionX,PosicionY,T,T);
   fill(#ffffff);
   ellipse(PosicionX-T/4,PosicionY-T/4,T/2.5,T/2.5);
   ellipse(PosicionX+T/4,PosicionY-T/4,T/2.5,T/2.5);
if (mouseX>360&&mouseX<485&&mouseY>280&&mouseY<370){textSize(25);
fill(#D95B66);
text ("Huang-long:",45,425); text ("Representa el elemento de la Tierra",45,450);
text ("Su criatura celestial es el Dragon Amarillo",105.5,475);}
   }
 
if(estado==estado3){
   background(255);
   ellipseMode(CENTER);
   fill(#0D80FF);
   ellipse(110,320,130,130);
   fill(#ffffff);
   ellipse(110-130/4,320-130/4,130/2.5,130/2.5);
   ellipse(110+130/4,320-130/4,130/2.5,130/2.5);}
   }
  
}

}

class Key{
  float PosicionX, PosicionY, Tamano;
  color Color;
  
Key(float PosicionX_,float PosicionY_,float Tamano_, color Color_){
  PosicionX=PosicionX_;
  PosicionY=PosicionY_;
  Tamano=Tamano_;
  Color=Color_;}

void displayKey(){
  float Dis= dist(mouseX,mouseY,PosicionX,PosicionY);
  float T;
  
if(estado == estado2){
   T= 100;
   ellipseMode(CENTER);
   fill(Color);
   ellipse(PosicionX,PosicionY,T,T);
   fill(#ffffff);
   ellipse(PosicionX-T/4,PosicionY-T/4,T/2.5,T/2.5);
   ellipse(PosicionX+T/4,PosicionY-T/4,T/2.5,T/2.5);
 if(Dis<Tamano/2){T = 110;
   fill(Color);
   ellipse(PosicionX,PosicionY,T,T);
   fill(#ffffff);
   ellipse(PosicionX-T/4,PosicionY-T/4,T/2.5,T/2.5);
   ellipse(PosicionX+T/4,PosicionY-T/4,T/2.5,T/2.5);
if (mouseX>500&&mouseX<625&&mouseY>280&&mouseY<370){ textSize(25);
fill(#D95B66);
text ("Bai-hu:",45,425); text ("Representa el elemento del Metal",45,450); 
text ("Su criatura celestial es el Tigre Blanco",105.5,475);}
   }
}
  
}

}

class One{
  float PosicionX, PosicionY, Tamano;
  color Color;
  
One(float PosicionX_,float PosicionY_,float Tamano_, color Color_){
  PosicionX=PosicionX_;
  PosicionY=PosicionY_;
  Tamano=Tamano_;
  Color=Color_;}

void displayOne(){
  float Dis= dist(mouseX,mouseY,PosicionX,PosicionY);
  float T;
  
if(estado == estado2){
   T= 100;
   ellipseMode(CENTER);
   fill(Color);
   ellipse(PosicionX,PosicionY,T,T);
   fill(#ffffff);
   ellipse(PosicionX-T/4,PosicionY-T/4,T/2.5,T/2.5);
   ellipse(PosicionX+T/4,PosicionY-T/4,T/2.5,T/2.5);
 if(Dis<Tamano/2){T = 110;
   fill(Color);
   ellipse(PosicionX,PosicionY,T,T);
   fill(#ffffff);
   ellipse(PosicionX-T/4,PosicionY-T/4,T/2.5,T/2.5);
   ellipse(PosicionX+T/4,PosicionY-T/4,T/2.5,T/2.5);
if (mouseX>640&&mouseX<765&&mouseY>280&&mouseY<370){textSize(25);
fill(#D95B66);
text ("Xuan-wu:",45,425); text ("Representa el elemento del Agua",45,450); 
text ("Su criatura celestial es la Tortuga",105.5,475);}
   }
}
  
}

}
