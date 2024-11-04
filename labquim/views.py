from django.shortcuts import render, redirect
from django.views.generic import TemplateView , View
from django.http import HttpResponse
from .models import TipoDocumento , Paciente , Metodo , UnidadMed , Medico , Extraccionista, SolicitudAnalisis, EstadoSolicitud, Estudios, HistorialEstudios, HistorialSolicitud, EstadoEstudio, Resultados, Muestra
from .forms import user_form , insert_paciente ,insert_type_document , insert_metodo, insert_unimed , insert_estado_solicitud,insert_estado_estudio, insert_medico,insert_extraccionista,insert_estudios,insert_soli_analisis , insert_hist_solicitud, insert_hist_estudios, insert_resultados, insert_muestra


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
    form_insert_estudios=insert_estudios
    form_inser_soli_analisis=insert_soli_analisis
    form_insert_hist_soli=insert_hist_solicitud
    form_insert_hist_estudios=insert_hist_estudios
    form_insert_resultados=insert_resultados
    form_insert_muestra=insert_muestra

    def get(self, request, *args, **kwargs):
        insert_estudios = self.form_insert_estudios()
        insert_hist_estudios = self.form_insert_hist_estudios()
        insert_paciente = self.form_insert_p()
        insert_metodo = self.form_insert_method()
        insert_type_document = self.form_insert_td()
        insert_unimed = self.form_insert_unimed()
        insert_estado_solicitud = self.form_insert_est_soli()
        insert_muestra = self.form_insert_muestra()
        insert_medico= self.form_insert_medico()
        insert_estado_estudio=self.form_insert_est_estu()
        insert_extraccionista=self.form_insert_extrac()
        insert_soli_analisis=self.form_inser_soli_analisis()
        insert_hist_solicitud=self.form_insert_hist_soli()
        form_insert_resultados=self.form_insert_resultados()
        list_hist_soli=HistorialSolicitud.objects.all()
        list_type_documents = TipoDocumento.objects.all()
        list_muestras = Muestra.objects.all()
        list_pacientes = Paciente.objects.all()
        list_metodos = Metodo.objects.all()
        list_unimed = UnidadMed.objects.all()
        list_estados=EstadoSolicitud.objects.all()
        list_estados_estudio=EstadoEstudio.objects.all()
        list_medicos=Medico.objects.all()
        list_extraccionistas=Extraccionista.objects.all()
        list_estudios=Estudios.objects.all()
        list_soli_analisis=SolicitudAnalisis.objects.all()
        list_hist_estudios=HistorialEstudios.objects.all()
        list_hist_soli=HistorialSolicitud.objects.all()
        list_resultados=Resultados.objects.all()

        context = {
            'form_paciente': insert_paciente,
            'form_type_document': insert_type_document,
            'type_documents': list_type_documents,
            'form_metodo': insert_metodo, 
            'form_unimed': insert_unimed,
            'form_est_soli': insert_estado_solicitud,'form_extrac':insert_extraccionista,
            'form_est_estu':insert_estado_estudio,
            'form_soli_analisis':insert_soli_analisis,
            'form_hist_estudios':insert_hist_estudios,
            'form_medico':insert_medico,
            'form_hist_soli':insert_hist_solicitud,
            'form_resultados':form_insert_resultados,
            'form_muestra':insert_muestra,
            'muestras_list':list_muestras,
            'resultados_list':list_resultados,
            'medicos_list':list_medicos,
            'metodo_list': list_metodos,
            'unimed_list': list_unimed,
            'list_hist_soli': list_hist_soli,
            'form_insert_estudios':insert_estudios,
            'estudios_list':list_estudios,
            'list_estados_estudio':list_estados_estudio,
            'list_estados':list_estados,
            'pacientes_list': list_pacientes,
            'list_extraccionistas':list_extraccionistas,
            'list_soli_analisis':list_soli_analisis,
            'list_hist_estudios':list_hist_estudios
        }

        return render(request, self.template_name, context)

    def post(self, request, *args, **kwargs):
        if 'form_type_document' in request.POST: 
            form_insert_td = insert_type_document(request.POST)

            if form_insert_td.is_valid():
                insert_td = TipoDocumento(
                    tipo_documento=form_insert_td.cleaned_data['tipo_documento']
                )
                insert_td.save()
                return redirect('success')  
            else:
                return redirect('failed')  
        elif 'form_paciente' in request.POST:  
            form_paciente = insert_paciente(request.POST)

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
            form_metodo = insert_metodo(request.POST)
            if form_metodo.is_valid():
                insert_m = Metodo(
                    descripcion=form_metodo.cleaned_data['descripcion']
                )
                insert_m.save()
                return redirect('success')  
            else:
                return redirect('failed')
        elif 'form_unimed' in request.POST:
            form_unimed = insert_unimed(request.POST)
            if form_unimed.is_valid():
                insert_u = UnidadMed(
                    nombre=form_unimed.cleaned_data['nombre']
                )
                insert_u.save()
                return redirect('success')  
            else:
                return redirect('failed')
        elif 'form_est_soli' in request.POST:
            form_est_soli = insert_estado_solicitud(request.POST)
            if form_est_soli.is_valid():
                insert_s = EstadoSolicitud(
                    estado=form_est_soli.cleaned_data['estado']
                )
                insert_s.save()
                return redirect('success')  
            else:
                return redirect('failed')
        elif 'form_est_estu' in request.POST:
            form_est_estu = insert_estado_estudio(request.POST)
            if form_est_estu.is_valid():
                insert_e = EstadoEstudio(
                    estado=form_est_estu.  cleaned_data['estado']
                )
                insert_e.save()
                return redirect('success')  
            else:
                return redirect('failed')
        elif 'form_medico' in request.POST:
            form_medico = insert_medico(request.POST)
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
            form_extrac = insert_extraccionista(request.POST)
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
        elif 'form_insert_estudios' in request.POST:
            form_estudios = insert_estudios(request.POST)
            if form_estudios.is_valid():
                insert_e = Estudios(
                    descripcion=form_estudios.cleaned_data['descripcion'],
                    id_metodo=form_estudios.cleaned_data['id_metodo'],
                    valor_minimo=form_estudios.cleaned_data['valor_minimo'],
                    valor_maximo=form_estudios.cleaned_data['valor_maximo'],
                    cod_unidad_med=form_estudios.cleaned_data['cod_unidad_med'])
                insert_e.save()
                return redirect('success')  
            else:
                return redirect('failed')
        elif 'form_soli_analisis' in request.POST:
            form_analisis = insert_soli_analisis(request.POST)
            if form_analisis.is_valid():
                insert_a = SolicitudAnalisis(
                    id_paciente=form_analisis.cleaned_data['id_paciente'],
                    id_extraccionista=form_analisis.cleaned_data['id_extraccionista'],
                    hora=form_analisis.cleaned_data['hora'],
                    id_medico=form_analisis.cleaned_data['id_medico'],
                    nombre_archivo=form_analisis.cleaned_data['nombre_archivo'])
                insert_a.save()  
                return redirect('success')  
            else:
                return redirect('failed')
        elif 'form_hist_soli' in request.POST:
            formhist_soli = insert_hist_solicitud(request.POST)
            if formhist_soli.is_valid():
                insert_h = HistorialSolicitud(
                    id_soli_analisis=formhist_soli.cleaned_data['id_soli_analisis'],
                    fecha_recepcion=formhist_soli.cleaned_data['fecha_recepcion'],
                    fecha_finalizacion=formhist_soli.cleaned_data['fecha_finalizacion'],
                    fecha_receta=formhist_soli.cleaned_data['fecha_receta'],
                    id_estado=formhist_soli.cleaned_data['id_estado'],
                )
                insert_h.save()  
                return redirect('success')  
            else:
                return redirect('failed')
        elif 'form_hist_estudios' in request.POST:
            formhist_estudios = insert_hist_estudios(request.POST)
            if formhist_estudios.is_valid():
                insert_h = HistorialEstudios(
                    id_estudio=formhist_estudios.cleaned_data['id_estudio'],
                    fecha_inicio=formhist_estudios.cleaned_data['fecha_inicio'],
                    fecha_fin=formhist_estudios.cleaned_data['fecha_fin'],
                    id_estado=formhist_estudios.cleaned_data['id_estado'],

                )
                insert_h.save()  
                return redirect('success')  
            else:
                return redirect('failed')
        elif 'form_muestra' in request.POST:
            form_muestra = insert_muestra(request.POST)
            if form_muestra.is_valid():
                insert_m = Muestra(
                    tipo_muestra=form_muestra.cleaned_data['tipo_muestra'])
                insert_m.save()
                return redirect('success')
            else:
                return redirect('failed')
        elif 'form_resultados' in request.POST:
            form_resultados = insert_resultados(request.POST)
            if form_resultados.is_valid():
                insert_r = Resultados(
                    id_soli_analisis=form_resultados.cleaned_data['id_soli_analisis'],
                    id_muestra=form_resultados.cleaned_data['id_muestra'],
                    valor_hallado=form_resultados.cleaned_data['valor_hallado'],
                    observaciones=form_resultados.cleaned_data['observaciones'],)
                insert_r.save()
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