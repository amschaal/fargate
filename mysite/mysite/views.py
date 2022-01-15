from django.http import HttpResponse


def index(request):
    return HttpResponse("First update to code on fargate with github actions.")
