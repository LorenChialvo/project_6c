from django.shortcuts import render, redirect
from django.views.generic import TemplateView , View
from django.http import HttpResponse
from .models import USerForm
from .forms import user_form


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
