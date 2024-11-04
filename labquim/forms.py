from django import forms
from .models import USerForm , Paciente , TipoDocumento , Muestra , Resultados , Estudios , HistorialEstudios , HistorialSolicitud  , EstadoEstudio , EstadoSolicitud , UnidadMed , Extraccionista , Medico , SolicitudAnalisis, Metodo

class user_form(forms.ModelForm):
    class Meta:
        model = USerForm
        fields = ['dni', 'cap']
        widgets = {
            'dni': forms.TextInput(attrs={'class': 'form-control'}),
            'cap': forms.TextInput(attrs={'class': 'password-container',}),
        }
class insert_type_document(forms.ModelForm):
    class Meta:
        model = TipoDocumento
        fields = ['tipo_documento']
        widgets = {'tipo_documento': forms.TextInput(attrs={'class': 'form-control'})}
class insert_paciente(forms.ModelForm):
    class Meta:
        model = Paciente
        fields = ['nombre', 'apellido', 'email', 'id_tipo_documento', 'numero_documento']
        labels = {
            'nombre': 'Nombre del Paciente',
            'apellido': 'Apellido del Paciente',
            'email': 'Correo Electrónico',
            'id_tipo_documento': 'Tipo de Documento',
            'numero_documento': 'Número de Documento'
        }   
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control'}),
            'apellido': forms.TextInput(attrs={'class': 'form-control'}),
            'email': forms.EmailInput(attrs={'class': 'form-control'}),
            'numero_documento': forms.TextInput(attrs={'class': 'form-control'}),
        }
        id_tipo_documento = forms.ModelChoiceField(
            queryset=TipoDocumento.objects.all(),  
            widget=forms.Select(attrs={'class': 'form-control'}),
            empty_label="Seleccione un tipo de documento"  
        )
class insert_metodo(forms.ModelForm):
    class Meta:
        model = Metodo
        fields = ['descripcion']
        labels = {
            'descripcion': 'Tipo de Metodo Utilizado',
        }   
        widgets = {
            'descripcion': forms.TextInput(attrs={'class': 'form-control'})
        }
class insert_unimed(forms.ModelForm):
    class Meta:
        model = UnidadMed
        fields = ['nombre']
        labels = {
            'nombre': 'Unidad de medida'
        }   
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control'})
        }
class insert_estado_solicitud(forms.ModelForm):
    class Meta:
        model = EstadoSolicitud
        fields = ['estado']
        labels = {
            'estado': 'Estado de la Solicitud',
        }   
        widgets = {
            'estado': forms.TextInput(attrs={'class': 'form-control'})
        }
class insert_estado_estudio(forms.ModelForm):
    class Meta:
        model = EstadoEstudio
        fields = ['estado']
        labels = {
            'estado': 'Estado del Estudio',
        }   
        widgets = {
            'estado': forms.TextInput(attrs={'class': 'form-control'})
        }

class insert_medico(forms.ModelForm):
    class Meta:
        model = Medico
        fields = ['nombre', 'apellido', 'especializacion']
        labels = {
            'nombre': 'Nombre del Medico',
            'apellido': 'Apellido del Medico',
            'especializacion': 'Especialidad del Medico',
        }   
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control'}),
            'apellido': forms.TextInput(attrs={'class': 'form-control'}),
            'especializacion': forms.TextInput(attrs={'class': 'form-control'})
        }
class insert_extraccionista(forms.ModelForm):
    class Meta:
        model = Extraccionista
        fields = ['nombre', 'apellido', 'email', 'id_tipo_documento', 'numero_documento']
        labels = {
            'nombre': 'Nombre del Extraccionista',
            'apellido': 'Apellido del Extraccionista',
            'email': 'Correo Electronico',
            'id_tipo_documento': 'Tipo de Documento',
            'numero_documento': 'Numero de Documento'
        }   
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control'}),
            'apellido': forms.TextInput(attrs={'class': 'form-control'}),
            'email': forms.EmailInput(attrs={'class': 'form-control'}),
            'numero_documento': forms.TextInput(attrs={'class': 'form-control'}),
        }
        id_tipo_documento = forms.ModelChoiceField(
            queryset=TipoDocumento.objects.all(),  
            widget=forms.Select(attrs={'class': 'form-control'}),
            empty_label="Seleccione un tipo de documento"  
        )
class insert_estudios(forms.ModelForm):
    class Meta:
        model = Estudios
        fields = ['descripcion','id_metodo','valor_minimo','valor_maximo','cod_unidad_med']
        labels = {
            'descripcion': 'Tipo de Estudio',
            'id_metodo': 'Metodo Utilizado',
            'valor_minimo': 'Valor Minimo',
            'valor_maximo': 'Valor Maximo',
            'cod_unidad_med': 'Unidad de Medida',
        }   
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control'}),
            'valor_minimo': forms.TextInput(attrs={'class': 'form-control'}),
            'valor_maximo': forms.TextInput(attrs={'class': 'form-control'})
        }
        id_metodo = forms.ModelChoiceField(
            queryset=Metodo.objects.all(),  
            widget=forms.Select(attrs={'class': 'form-control'}),
            empty_label="Seleccione un tipo de documento"  ),
        cod_unidad_med = forms.ModelChoiceField(
            queryset=UnidadMed.objects.all(),  
            widget=forms.Select(attrs={'class': 'form-control'}),
            empty_label="Seleccione una unidad de medida"  )
class insert_soli_analisis(forms.ModelForm):
    class Meta:
        model = SolicitudAnalisis
        fields = ['id_paciente','id_extraccionista','hora','id_medico','nombre_archivo']
        labels = {
            'id_paciente': 'Paciente',
            'id_extraccionista': 'Extraccionista',
            'hora': 'Hora',
            'id_medico': 'Medico',
            'nombre_archivo': 'Nombre del Archivo',
        }   
        widgets = {
            'id_paciente': forms.Select(attrs={'class': 'form-control'}),
            'id_extraccionista': forms.Select(attrs={'class': 'form-control'}),
            'hora': forms.TimeInput(attrs={'class': 'form-control', 'type': 'time'}),
            }
        id_medico = forms.ModelChoiceField(
            queryset=Medico.objects.all(),  
            widget=forms.Select(attrs={'class': 'form-control'}),
            empty_label="Seleccione un Medico"  )
        id_paciente = forms.ModelChoiceField(
            queryset=Paciente.objects.all(),  
            widget=forms.Select(attrs={'class': 'form-control'}),
            empty_label="Seleccione un Paciente")
        id_extraccionista = forms.ModelChoiceField(
            queryset=Extraccionista.objects.all(),  
            widget=forms.Select(attrs={'class': 'form-control'}),
            empty_label="Seleccione un Extraccionista"
        )
class insert_hist_solicitud(forms.ModelForm):
    class Meta:
        model = HistorialSolicitud
        fields = ['id_soli_analisis','id_estado','fecha_recepcion','fecha_finalizacion','fecha_receta']
        labels = {
            'id_soli_analisis': 'Solicitud de Analisis',
            'id_estado': 'Estado de la Solicitud',
            'fecha_recepcion': 'Fecha de Recepcion',
            'fecha_finalizacion': 'Fecha de Finalizacion',
            'fecha_receta': 'Fecha de la Receta',
        }
        widgets = {
            'fecha_recepcion': forms.DateInput(attrs={'class': 'form-control', 'type': 'date'}),
            'fecha_finalizacion': forms.DateInput(attrs={'class': 'form-control', 'type': 'date'}),
            'fecha_receta': forms.DateInput(attrs={'class': 'form-control', 'type': 'date'}),
        }
        id_soli_analisis = forms.ModelChoiceField(
            queryset=SolicitudAnalisis.objects.all(),  
            widget=forms.Select(attrs={'class': 'form-control'}),
            empty_label="Seleccione una Solicitud de Analisis"
        )
        id_estado = forms.ModelChoiceField(
            queryset=EstadoSolicitud.objects.all(),  
            widget=forms.Select(attrs={'class': 'form-control'}),
            empty_label="Seleccione un Estado de la Solicitud"
        )
class insert_hist_estudios(forms.ModelForm):
    class Meta:
        model = HistorialEstudios
        fields = ['id_estudio','fecha_inicio','fecha_fin','id_estado']
        labels = {
            'id_estudio': 'Estudio',
            'fecha_inicio': 'Fecha de Inicio',
            'fecha_fin': 'Fecha de Fin',
            'id_estado': 'Estado del Estudio',
        }
        widgets = {
            'fecha_inicio': forms.DateInput(attrs={'class': 'form-control', 'type': 'date'}),
            'fecha_fin':forms.DateInput(attrs={'class': 'form-control', 'type': 'date'}),
        }
        id_estudio = forms.ModelChoiceField(
            queryset=Estudios.objects.all(),  
            widget=forms.Select(attrs={'class': 'form-control'}),
            empty_label="Seleccione un Estudio"
        )
        id_estado = forms.ModelChoiceField(
            queryset=EstadoEstudio.objects.all(),  
            widget=forms.Select(attrs={'class': 'form-control'}),
            empty_label="Seleccione un estado del Estudio"
        )
class insert_resultados(forms.ModelForm):
    class Meta:
        model = Resultados
        fields = ['id_soli_analisis','id_muestra','valor_hallado', 'id_estado', 'observaciones']
        labels = {
            'id_soli_analisis': 'Solicitud de Analisis',
            'id_muestra': 'Muestra',
            'valor_hallado': 'Valor Hallado',
            'id_estado': 'Estado del Estudio',
            'observaciones': 'Observaciones',
        }   
        widgets = {
            'valor_hallado': forms.TextInput(attrs={'class': 'form-control'}),
            'observaciones': forms.TextInput(attrs={'class': 'form-control'}),
            
        }
        id_soli_analisis = forms.ModelChoiceField(
            queryset=SolicitudAnalisis.objects.all(),  
            widget=forms.Select(attrs={'class': 'form-control'}),
            empty_label="Seleccione una Solicitud de Analisis"
        )
        id_muestra = forms.ModelChoiceField(
            queryset=Muestra.objects.all(),  
            widget=forms.Select(attrs={'class': 'form-control'}),
            empty_label="Seleccione una muestra"
        )
        id_estado = forms.ModelChoiceField(
            queryset=EstadoEstudio.objects.all(),  
            widget=forms.Select(attrs={'class': 'form-control'}),
            empty_label="Seleccione un estado del Estudio"
        )
class insert_muestra(forms.ModelForm):
    class Meta:
        model = Muestra
        fields = ['tipo_muestra']
        labels = {
            'tipo_muestra': 'Tipo de Muestra',
        }   
        widgets = {
            'tipo_muestra': forms.TextInput(attrs={'class': 'form-control'})
        }