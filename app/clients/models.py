from django.db import models
from django.contrib.auth.models import User


class Client(models.Model):
    user = models.OneToOneField(User, on_delete=models.PROTECT) # связываю базовых User c классом и проверяю связи при удалении
    company_name = models.CharField(max_length=100)
    telegram_id = models.CharField(max_length=100)

    def __str__(self):
        return f"Client: {self.company_name}"
