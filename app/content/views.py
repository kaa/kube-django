import random
from django.shortcuts import render

from django.views.generic import TemplateView

class IndexView(TemplateView):
    template_name = "index.html"

    def get_context_data(self, **kwargs):
      return { "weather": "raining" if random.randint(0,1)==0 else "snowing" }