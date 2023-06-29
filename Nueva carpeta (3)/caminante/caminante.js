class Caminante {
  constructor() {
    this.x = random(width);
    this.y = 0; // Iniciar en la parte superior del lienzo
    this.vel = 3;
    this.dir = radians(90); // Cambiar la dirección a 90 grados para moverse hacia abajo
    this.diam = random(15, 40);
    this.elColor = color(random(255), random(255), random(255));
    this.estado = 0; // Estado del caminante (0: Movimiento vertical, 1: Movimiento horizontal)
    this.imagen = loadImage('caminante.png');
  }

  mover() {
    if (this.estado === 0) { // Movimiento vertical
      let nuevaX = this.x;
      let nuevaY = this.y + this.vel;

      if (nuevaY >= height) { // Si alcanza la parte inferior del lienzo
        this.teletransportarHorizontal();
      } else {
        this.x = nuevaX;
        this.y = nuevaY;
        posiciones.push(createVector(this.x, this.y));
      }
    } else { // Movimiento horizontal
      let nuevaX = this.x + this.vel;
      let nuevaY = this.y;

      if (nuevaX >= width) { // Si alcanza el borde derecho del lienzo
        this.teletransportarVertical();
      } else {
        this.x = nuevaX;
        this.y = nuevaY;
        posiciones.push(createVector(this.x, this.y));
      }
    }
  }

  teletransportarVertical() {
    this.x = random(width); // Teletransportarse a una posición X aleatoria
    this.y = 0; // Teletransportarse a la parte superior del lienzo
    this.estado = 0; // Cambiar al estado de movimiento vertical
  }

  teletransportarHorizontal() {
    this.x = 0; // Teletransportarse a la parte izquierda del lienzo
    this.y = random(height); // Teletransportarse a una posición Y aleatoria
    this.estado = 1; // Cambiar al estado de movimiento horizontal
  }

  dibujar() {
    image(this.imagen, this.x, this.y, this.diam, this.diam);
  }
}