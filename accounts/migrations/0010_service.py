# Generated by Django 4.1.7 on 2023-04-11 20:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0009_remove_userprofile_age_alter_userprofile_city_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='Service',
            fields=[
                ('sno', models.AutoField(primary_key=True, serialize=False)),
                ('services', models.CharField(max_length=100)),
            ],
        ),
    ]