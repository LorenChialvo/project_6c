from django import forms
from .models import USerForm    

class user_form(forms.Form):
    first_name = forms.CharField(max_length=200)
    last_name = forms.CharField(max_length=200)
    hola = forms.CharField(max_length=200)
    
class user_form(forms.ModelForm):
    class   Meta:
        model = USerForm
        fields = ['dni', 'cap']
        widgets = {
            'dni': forms.TextInput(attrs={'class': 'form-control'}),
            'cap': forms.TextInput(attrs={'class': 'password-container',}),
        }



