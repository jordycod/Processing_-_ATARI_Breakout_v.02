//AP2 - EXPANSÃO DE CÓDIGO
//Jordy Muniz Araúo
//Programação II - Horário 20h
//Matrícula: 500872

//Classes.
Bola a, b;
Barra Barra;
Blocos[][] Blocos;

//Variáveis elementos gráficos.
int linhas, colunas, pontos, vidas;
int corTexto, corFundo, corElementos, opacidade;
boolean fase1 = true, fase2 = false;
PImage bola, life, points;

void setup() {
  size(750, 750);
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER);
  textSize(height/50);
  noStroke();

  //Atributos gráficos básicos, contadores e elementos gráficos estáticos.
  corElementos = 250;
  corTexto = 200;
  corFundo = 20;
  opacidade = 150;

  pontos = 0;
  vidas = 5;  
  linhas = 2;
  colunas = 4; 
  mostraCenario(colunas, linhas);
}

//Ativação/Exibição de funções e elementos gráficos móveis.
void draw() {
  background(corFundo);

  if (fase1 == true) {
    a.desenha();
    Barra.desenha();
  } 
  if (fase2 == true) {
    a.desenha();
    b.desenha();
    Barra.desenha();
  }

  a.checaBarra(Barra);
  b.checaBarra(Barra);

  mostrarBlocos(); 
  mostraElementos();
}

//Relação da posição dos blocos e da bolinha para obter as colisões.
void mostrarBlocos() { 
  for (int i = 0; i < Blocos.length; i++) {
    for (int j = 0; j < Blocos[0].length; j++) {
      Blocos[i][j].desenha();
      Blocos[i][j].checaBola(a);
      Blocos[i][j].checaBola(b);
    }
  }
}

//Estrutura de elementos gráficos móveis.
void mostraCenario(int linhas, int colunas) { //Desenho dos elementos na tela (bola, barra e blocos).
  a = new Bola();
  b = new Bola();

  Barra = new Barra();
  Blocos = new Blocos[linhas][colunas];

  for (int i = 0; i < Blocos.length; i++) {
    for (int j = 0; j < Blocos[0].length; j++) {
      Blocos[i][j] = new Blocos(i, j+1, Blocos.length);
    }
  }
}

boolean limpaBlocos() { //Remoção de blocos após colisão com a bolinha.
  for (int i = 0; i < Blocos.length; i++) {
    for (int j = 0; j < Blocos[0].length; j++) {
      if (Blocos[i][j].status) { //No objeto "Blocos" existe uma variável booleana "status" que, enquanto "true" exibe os blocos. Após a colisão, muda para "false" e o bloco some.
        return false;
      }
    }
  }
  return true;
}

void mousePressed() {

  if (vidas > 0 && fase1 == true) { //Condição para reinício de jogo.
    a.yBola -= 10;
    a.iniciar = true;
    
  } else if (vidas > 0 && fase2 == true) {
    a.yBola -= 10;
    b.yBola -= 10;
    a.iniciar = true;
    b.iniciar = true;
  } else {
    setup();
  }
}

void keyPressed() {
  if (fase1 == true && pontos == a.pontMaxima && keyCode == ENTER) {
    
    fase1 = false;
    fase2 = true;

    vidas = vidas + vidas;
    linhas = linhas + linhas;
    colunas = colunas + colunas;
    mostraCenario(colunas, linhas);
    pontos = 0;
    Barra.wBarra = height/4;
  }
}
