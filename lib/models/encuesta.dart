class Encuesta{
  int id;  
  String titulo;
  String descripcion;
  int cantidadPreguntas;
  String  estado;      
  String fechaCreacion;
  String fechaInicioVigencia;
  String fechaFinVigencia;
  int idUsuario;

  Encuesta({
    this.id,
    this.titulo,
    this.descripcion,
    this.cantidadPreguntas,
    this.estado,
    this.fechaCreacion,
    this.fechaInicioVigencia,
    this.fechaFinVigencia,    
    this.idUsuario
    
  });
}