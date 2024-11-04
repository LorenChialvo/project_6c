# Generated by Django 5.0.6 on 2024-10-28 13:40

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('labquim', '0002_userform'),
    ]

    operations = [
        migrations.AddField(
            model_name='estudios',
            name='id_estado_estudio',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='labquim.estadoestudio'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='solicitudanalisis',
            name='id_estado_solicitud',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='labquim.estadosolicitud'),
            preserve_default=False,
        ),
    ]
