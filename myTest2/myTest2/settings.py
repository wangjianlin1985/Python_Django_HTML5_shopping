"""
Django settings for myTest2 project.

For more information on this file, see
https://docs.djangoproject.com/en/1.6/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.6/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
BASE_DIR = os.path.dirname(os.path.dirname(__file__))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.6/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '$waebv)555=o6pmyh6p-u5at7l6e0ydjii68_v&artri%)*(*y'

# SECURITY WARNING: don't run with debug turned on in production!
# 避免在抛出异常时暴露代码结构,把True改False,并且ALLOWED_HOSTS = [‘127.0.0.1‘, ‘localhost‘]
DEBUG = True

TEMPLATE_DEBUG = True

ALLOWED_HOSTS = []

#CACHE_BACKEND='db://mycache'
#CACHE_BACKEND='file:///usr/local/tmp'

# Application definition

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'myApp',
)

MIDDLEWARE_CLASSES = (
    'myApp.myMiddleware.MyMiddleWare',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
   # 'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django.middleware.gzip.GZipMiddleware',
)

ROOT_URLCONF = 'myTest2.urls'

WSGI_APPLICATION = 'myTest2.wsgi.application'

AUTHENTICATION_BACKENDS = (
    'django.contrib.auth.backends.ModelBackend',
)

# Database
# https://docs.djangoproject.com/en/1.6/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'USER':'root',
        'PASSWORD':'123456',
        'NAME':'test',
        'HOST':'localhost'
    }
}


# Internationalization
# https://docs.djangoproject.com/en/1.6/topics/i18n/

LANGUAGE_CODE = 'zh-CN'

TIME_ZONE = 'Asia/Shanghai'

USE_I18N = True

USE_L10N = True

USE_TZ = True

#自定义用户Model
AUTH_USER_MODEL = 'myApp.User'

SESSION_SERIALIZER = 'django.contrib.sessions.serializers.PickleSerializer' #模板中可以使用{{request.session.*}}


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.6/howto/static-files/

STATIC_URL = '/static/'
STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'static'),
)

#TEMPLATE_DIRS = os.path.join(os.path.dirname(__file__),'templates')
TEMPLATE_DIRS = tuple(os.path.join(os.path.dirname(__file__),'templates'))

from django.conf import global_settings
TEMPLATE_CONTEXT_PROCESSORS = global_settings.TEMPLATE_CONTEXT_PROCESSORS + (
    "myApp.views.global_settings",
)


#定义上传目录
MEDIA_URL = '/uploads/' #url映射路径

MEDIA_ROOT = os.path.join(BASE_DIR, 'uploads')#上传路径

