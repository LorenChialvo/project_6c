from django.db import models

class USerForm(models.Model):
    dni = models.CharField(max_length=100)
    cap = models.CharField(max_length=100)

class EstadoEstudio(models.Model):
    id_estado = models.AutoField(primary_key=True)
    estado = models.CharField(max_length=255)

class EstadoSolicitud(models.Model):
    id_estado = models.AutoField(primary_key=True)
    estado = models.CharField(max_length=255)
    
class UnidadMed(models.Model):
    cod_unidad_med = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=255)

class Metodo(models.Model):
    id_metodo = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=255)

class TipoDocumento(models.Model):
    id_tipo_documento = models.AutoField(primary_key=True)
    tipo_documento = models.CharField(max_length=255)

class Paciente(models.Model):
    id_paciente = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=255)
    apellido = models.CharField(max_length=255)
    email = models.EmailField()
    id_tipo_documento = models.ForeignKey(TipoDocumento, on_delete=models.CASCADE)
    numero_documento = models.IntegerField()

class Medico(models.Model):
    id_medico = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=255)
    apellido = models.CharField(max_length=255)
    especializacion = models.CharField(max_length=255)

class Extraccionista(models.Model):
    id_extraccionista = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=255)
    apellido = models.CharField(max_length=255)
    email = models.EmailField()
    id_tipo_documento = models.ForeignKey(TipoDocumento, on_delete=models.CASCADE)
    numero_documento = models.IntegerField()

class Muestra(models.Model):
    id_muestra = models.AutoField(primary_key=True)
    tipo_muestra = models.CharField(max_length=255)

class Estudios(models.Model):
    id_estudio = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=255)
    id_metodo = models.ForeignKey(Metodo, on_delete=models.CASCADE)
    valor_minimo = models.FloatField()
    valor_maximo = models.FloatField()
    cod_unidad_med = models.ForeignKey(UnidadMed, on_delete=models.CASCADE)

class SolicitudAnalisis(models.Model):
    id_soli_analisis = models.AutoField(primary_key=True)
    id_paciente = models.ForeignKey(Paciente, on_delete=models.CASCADE)
    id_extraccionista = models.ForeignKey(Extraccionista, on_delete=models.CASCADE)
    hora = models.TimeField()
    id_medico = models.ForeignKey(Medico, on_delete=models.CASCADE)
    nombre_archivo = models.CharField(max_length=255)

class HistorialSolicitud(models.Model):
    id_historial_soli = models.AutoField(primary_key=True)
    id_soli_analisis = models.ForeignKey(SolicitudAnalisis, on_delete=models.CASCADE)
    id_estado = models.ForeignKey(EstadoSolicitud, on_delete=models.CASCADE)
    fecha_recepcion = models.DateField()
    fecha_finalizacion = models.DateField()
    fecha_receta = models.DateField()

class HistorialEstudios(models.Model):
    id_historial_estu = models.AutoField(primary_key=True)
    id_estudio = models.ForeignKey(Estudios, on_delete=models.CASCADE)
    fecha_inicio = models.DateField()
    fecha_fin = models.DateField()
    id_estado = models.ForeignKey(EstadoEstudio, on_delete=models.CASCADE)

class Resultados(models.Model):
    id_resultados = models.AutoField(primary_key=True)
    id_soli_analisis = models.ForeignKey(SolicitudAnalisis, on_delete=models.CASCADE)
    id_muestra = models.ForeignKey(Muestra, on_delete=models.CASCADE)
    valor_hallado = models.FloatField()
    id_estado = models.ForeignKey(EstadoEstudio, on_delete=models.CASCADE)
    observaciones = models.TextField()

