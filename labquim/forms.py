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
        fields = ['nombre']
        labels = {
            'nombre': 'Nombre del Estudio',
        }   
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control'})
