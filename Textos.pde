void mostraElementos() {
  strokeWeight(height/80);
  stroke(corElementos);
  noFill();
  rectMode(CORNER);
  rect(0, 0, width, height);
  strokeWeight(0);

  //Título
  fill(corTexto);
  text("BREAKOUT - ATARI, BY JORDY MUNIZ", width/2, height-height/30);

  //Pontuação no canto inferior direito da tela.
  points = loadImage("points.png");
  image(points, width/10*8.2, height-height/25, height/40, height/40);
  fill(corTexto);
  text("PONTOS: " + pontos, width/10*9, height-height/30);

  //Contador de vidas no canto inferior esquerdo da tela.
  life = loadImage("vidas.png");
  image(life, width/25, height-height/25, height/50, height/50);
  fill(corTexto);  
  text("VIDAS: " + vidas, width/10, height-height/30);

  //Condição para mensagem de fim de jogo, caso as vidas cheguem a zero.
  if (vidas == 0) { 
    fill(corTexto);  
    text("SUAS VIDAS ACABARAM!", width/2, height/2.3);
    text("CLIQUE EM QUALQUER LUGAR PARA REINICIAR.", width/2, height/2);
  }
}

//Mensagem de encerramento quando a pontuação máxima é atingida e reposicionamento da(s) bola(s).
void msgFim() {

  fill(corTexto);
  text("PARABÉNS! VOCÊ ATINGIU A PONTUAÇÃO MÁXIMA!", width/2, height/2.3);
  text("PONTUAÇÃO: " + pontos, width/2, height/2);

  if (fase1 == true) {
    text("PRESSIONE ENTER PARA IR PARA A PRÓXIMA FASE", width/2, height/1.8);
  } else {
    text("FIM DE JOGO!", width/2, height/1.8);
  }
}
