class Barra {
  float xBarra, yBarra, wBarra, hBarra;

  Barra() {
    wBarra = height/5;
    hBarra = height/50;
    xBarra = width/2;
    yBarra = height - height/10;
  }

  void desenha() {
    rectMode(CENTER);
    fill(corElementos);
    rect(xBarra, yBarra, wBarra, hBarra, 3);
    //barra = loadImage("barra.png");
    //image(barra, xBarra, yBarra, wBarra, hBarra);
    mover();
  }

  void mover() {
    xBarra = mouseX; 

    if (mouseX >= width - wBarra/2) { //Limite de movimento da barra à direita.
      xBarra = width - wBarra/2;
    } 
    if (mouseX <= wBarra/2) { //Limite de movimento da barra à esquerda.
      xBarra = wBarra/2;
    }
  }
}
