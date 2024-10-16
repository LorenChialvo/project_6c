from django.shortcuts import render, redirect
from django.views.generic import TemplateView , View
from django.http import HttpResponse
from .models import USerForm , TipoDocumento , Paciente , Metodo , UnidadMed , Medico , Extraccionista, SolicitudAnalisis, EstadoSolicitud, Estudios, HistorialEstudios, HistorialSolicitud, EstadoEstudio
from .forms import user_form , insert_paciente ,insert_type_document , insert_metodo, insert_unimed , insert_estado_solicitud,insert_estado_estudio, insert_medico,insert_extraccionista


def index(request):
    template_name = "login.html"
    form_class = user_form 
    def get(self, request, *args, **kwargs):
        form = self.form_class()
        return render(request, self.template_name, {'form': form})
    
    
class logintemplate(View):
    template_name = "login.html"
    form_class = user_form 
    def get(self, request, *args, **kwargs):
        form = self.form_class()
        return render(request, self.template_name, {'form_login': form})
class inicio(View):
    template_name = "home.html"
    def get(self, request, *args, **kwargs):
        return render(request, self.template_name)

class insertardatos(View):
    template_name = "insertdate.html"
    form_insert_p = insert_paciente
    form_insert_td = insert_type_document
    form_insert_method = insert_metodo
    form_insert_unimed = insert_unimed
    form_insert_est_soli = insert_estado_solicitud
    form_insert_est_estu=insert_estado_estudio
    form_insert_medico=insert_medico
    form_insert_extrac=insert_extraccionista

    def get(self, request, *args, **kwargs):
        insert_paciente = self.form_insert_p()
        insert_metodo = self.form_insert_method()
        insert_type_document = self.form_insert_td()
        insert_unimed = self.form_insert_unimed()
        insert_estado_solicitud = self.form_insert_est_soli()
        insert_medico= self.form_insert_medico()
        form_insert_estado_estudio=self.form_insert_est_estu()
        form_insert_extraccionista=self.form_insert_extrac()
        list_type_documents = TipoDocumento.objects.all()
        list_pacientes = Paciente.objects.all()
        list_metodos = Metodo.objects.all()
        list_unimed = UnidadMed.objects.all()
        list_estados=EstadoSolicitud.objects.all()
        list_estados_estudio=EstadoEstudio.objects.all()
        list_medicos=Medico.objects.all()
        list_extraccionistas=Extraccionista.objects.all()

        context = {
            'form_paciente': insert_paciente,
            'form_type_document': insert_type_document,
            'type_documents': list_type_documents,
            'pacientes_list': list_pacientes,
            'form_metodo': insert_metodo,
            'metodo_list': list_metodos,
            'form_unimed': insert_unimed,
            'unimed_list': list_unimed,
            'form_est_soli': insert_estado_solicitud,'form_extrac':form_insert_extraccionista,
            'list_estados':list_estados,
            'form_est_estu':form_insert_estado_estudio,
            'list_estados_estudio':list_estados_estudio,
            'form_medico':insert_medico,
            'medicos_list':list_medicos,
            'list_extraccionistas':list_extraccionistas
            
        }

        return render(request, self.template_name, context)

    def post(self, request, *args, **kwargs):
        if 'form_type_document' in request.POST: 
            form_insert_td = self.form_insert_td(request.POST)

            if form_insert_td.is_valid():
                insert_td = TipoDocumento(
                    tipo_documento=form_insert_td.cleaned_data['tipo_documento']
                )
                insert_td.save()
                return redirect('success')  
            else:
                return redirect('failed')  

        elif 'form_paciente' in request.POST:  
            form_paciente = self.form_insert_p(request.POST)

            if form_paciente.is_valid():
                insert_p = Paciente(
                    nombre=form_paciente.cleaned_data['nombre'],
                    apellido=form_paciente.cleaned_data['apellido'],
                    email=form_paciente.cleaned_data['email'],
                    id_tipo_documento=form_paciente.cleaned_data['id_tipo_documento'], 
                    numero_documento=form_paciente.cleaned_data['numero_documento']
                )
                insert_p.save()
                return redirect('success')  
            else:
                return redirect('failed')  

        elif 'form_metodo' in request.POST:
            form_metodo = self.form_insert_method(request.POST)
            if form_metodo.is_valid():
                insert_m = Metodo(
                    descripcion=form_metodo.cleaned_data['descripcion']
                )
                insert_m.save()
                return redirect('success')  
            else:
                return redirect('failed')
        elif 'form_unimed' in request.POST:
            form_unimed = self.form_insert_unimed(request.POST)
            if form_unimed.is_valid():
                insert_u = UnidadMed(
                    nombre=form_unimed.cleaned_data['nombre']
                )
                insert_u.save()
                return redirect('success')  
            else:
                return redirect('failed')
        elif 'form_est_soli' in request.POST:
            form_est_soli = self.form_insert_est_soli(request.POST)
            if form_est_soli.is_valid():
                insert_s = EstadoSolicitud(
                    estado=form_est_soli.cleaned_data['estado']
                )
                insert_s.save()
                return redirect('success')  
            else:
                return redirect('failed')
        elif 'form_est_estu' in request.POST:
            form_est_estu = self.form_insert_est_estu(request.POST)
            if form_est_estu.is_valid():
                insert_e = EstadoEstudio(
                    estado=form_est_estu.  cleaned_data['estado']
                )
                insert_e.save()
                return redirect('success')  
            else:
                return redirect('failed')
        elif 'form_medico' in request.POST:
            form_medico = self.form_insert_medico(request.POST)
            if form_medico.is_valid():
                insert_m = Medico(
                    nombre=form_medico.cleaned_data['nombre'],
                    apellido=form_medico.cleaned_data['apellido'],
                    especializacion=form_medico.cleaned_data['especializacion']
                )
                insert_m.save()
                return redirect('success')  
            else:
                return redirect('failed')
        elif 'form_extrac' in request.POST:
            form_extrac = self.form_insert_extrac(request.POST)
            if form_extrac.is_valid():
                insert_e = Extraccionista(
                    nombre=form_extrac.cleaned_data['nombre'],
                    apellido=form_extrac.cleaned_data['apellido'],
                    email=form_extrac.cleaned_data['email'],
                    id_tipo_documento=form_extrac.cleaned_data['id_tipo_documento'],
                    numero_documento=form_extrac.cleaned_data['numero_documento']
                )
                insert_e.save()
                return redirect('success')  
            else:
                return redirect('failed')
        
class success(View):
    template_name = "success.html"
    def get(self, request, *args, **kwargs):
        return render(request, self.template_name)
class failed(View):
    template_name = "failed.html"
    def get(self, request, *args, **kwargs):
        return render(request, self.template_name)
