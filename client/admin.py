from django.contrib import admin
from client.models import Contact, Feedback
# Register your models here.

@admin.register(Contact)
class ContactAdmin(admin.ModelAdmin):
    list_display =('name', 'phone', 'email', 'subject', 'message')
# admin.site.register(Contact)

@admin.register(Feedback)
class FeedbackAdmin(admin.ModelAdmin):
    list_display = ('user', 'name', 'message', 'rating')
# admin.site.register(Feedback)