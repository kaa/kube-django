import random
from django.shortcuts import render, redirect
from content.models import Content

def index(request):
    text = request.POST.get("text", None)
    if request.method=="POST" and text:
      content = Content.objects.create(text=text)
      content.save()
      return redirect("content")

    return render(request, "index.html", {
      "weather": "raining" if random.randint(0,1)==0 else "snowing",
      "texts": [ content.text for content in Content.objects.all() ]
    })