class Bola {
  float xBola, yBola, Vx, Vy, diamBola;
  int pontMaxima = linhas * colunas;
  boolean iniciar;

  Bola() { //Atributos da função Bola.
    diamBola = height/40;
    xBola = width/2;
    yBola = height/10 * 9 - diamBola;

    Vx = random(-5, 5);
    Vy = -15;
    iniciar = false;
  }

  void desenha () {
    bola = loadImage("bola.png");
    image(bola, xBola, yBola, diamBola+5, diamBola+5);
    mover();
  }

  void mover() {
    if (iniciar == true) { //Incremento nas velocidades de X e Y da bola.
      xBola += Vx;
      yBola += Vy;

      //Colisão nas bordas da desenha.
      if (xBola < diamBola/2) { //Esquerda.
        Vx *= -1;
        xBola = diamBola/2;
      }      
      if (xBola > width-diamBola/2) { //Direita.
        Vx *= -1;
        xBola = width-diamBola/2;
      }
      if (yBola < (int)diamBola/2) { //Cima.
        Vy *= -1;
      } else if (yBola > Barra.yBarra + 1.5*diamBola) { //Baixo (bola fora). Reiniciar.
        iniciar = false;
        yBola = Barra.yBarra - diamBola;
        vidas--;
      }
    } else {
      xBola = mouseX;
    }
    if (fase1 == true && pontos == pontMaxima || fase2 == true && pontos == pontMaxima) { 
      msgFim();
      xBola = mouseX;
      yBola = height/10 *9 - diamBola;
    }
  }

  void checaBarra(Barra Barra) {

    //Condições para colisão com a barra.
    if (xBola > Barra.xBarra - Barra.wBarra/2 && xBola < Barra.xBarra + Barra.wBarra/2 && yBola > Barra.yBarra - diamBola && yBola < Barra.yBarra+diamBola/10) {

      //Variações de velocidade de acordo com o ponto de colisão na barra.
      Vx *= (xBola - mouseX)/10;

      if (Vx > 5) {
        Vx = 5;
      }
      if (Vx < -5) {
        Vx = -5;
      }
      if (Vx < 0) {
        Vy = -15 - Vx;
      } 
      if (Vx > 0) {
        Vy = -15 + Vx;
      }
    }
  }
}
