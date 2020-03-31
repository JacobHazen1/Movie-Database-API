# Generated by Django 2.1.7 on 2020-03-28 00:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('theater', '0002_remove_theater_theater_id'),
    ]

    operations = [
        migrations.AddField(
            model_name='theater',
            name='Closing_time',
            field=models.TimeField(null=True, verbose_name='Closing'),
        ),
        migrations.AddField(
            model_name='theater',
            name='Opening_time',
            field=models.TimeField(null=True, verbose_name='Opening'),
        ),
        migrations.AddField(
            model_name='theater',
            name='Phone_number',
            field=models.CharField(max_length=12, null=True),
        ),
    ]
