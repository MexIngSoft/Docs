al intentar bajar el archivo de los resultados de lear hunter me salió esto TemplateDoesNotExist at /api/leadhunter/prospects/export.csv
rest_framework/api.html
Request Method:	GET
Request URL:	http://localhost:8020/api/leadhunter/prospects/export.csv?search_id=51ee2455-1f49-4187-ab83-5de7931f54fc
Django Version:	4.2.5
Exception Type:	TemplateDoesNotExist
Exception Value:	
rest_framework/api.html
Exception Location:	/usr/local/lib/python3.10/site-packages/django/template/loader.py, line 19, in get_template
Raised during:	gateway.views.export_csv
Python Executable:	/usr/local/bin/python3.10
Python Version:	3.10.20
Python Path:	
['',
 '/usr/local/bin',
 '/usr/src/api/leadhunter_gateway',
 '/usr/local/lib/python310.zip',
 '/usr/local/lib/python3.10',
 '/usr/local/lib/python3.10/lib-dynload',
 '/usr/local/lib/python3.10/site-packages']
Server time:	Sun, 07 Jun 2026 03:19:24 -0600
Template-loader postmortem
Django tried loading these templates, in this order:

Using engine :

This engine did not provide a list of tried templates.
Traceback Switch to copy-and-paste view
/usr/local/lib/python3.10/site-packages/django/core/handlers/exception.py, line 42, in inner
                response = await get_response(request) …
Local vars
/usr/local/lib/python3.10/site-packages/django/core/handlers/base.py, line 284, in _get_response_async
                    response = await sync_to_async( …
Local vars
/usr/local/lib/python3.10/concurrent/futures/thread.py, line 58, in run
            result = self.fn(*self.args, **self.kwargs) …
Local vars
/usr/local/lib/python3.10/site-packages/django/template/response.py, line 114, in render
            self.content = self.rendered_content …
Local vars
/usr/local/lib/python3.10/site-packages/rest_framework/response.py, line 70, in rendered_content
        ret = renderer.render(self.data, accepted_media_type, context) …
Local vars
/usr/local/lib/python3.10/site-packages/rest_framework/renderers.py, line 722, in render
        template = loader.get_template(self.template) …
Local vars
/usr/local/lib/python3.10/site-packages/django/template/loader.py, line 19, in get_template
    raise TemplateDoesNotExist(template_name, chain=chain) …
Local vars
Request information
USER
AnonymousUser

GET
Variable	Value
search_id	
'51ee2455-1f49-4187-ab83-5de7931f54fc'
POST
No POST data

FILES
No FILES data

COOKIES
Variable	Value
csrftoken	
'********************'
wv_visitor_id	
'visitor_1779008122811_ftbswz'
META
Variable	Value
HTTP_ACCEPT	
'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7'
HTTP_ACCEPT_ENCODING	
'gzip, deflate, br, zstd'
HTTP_ACCEPT_LANGUAGE	
'es-ES,es-MX;q=0.9,es;q=0.8'
HTTP_CONNECTION	
'keep-alive'
HTTP_COOKIE	
'********************'
HTTP_HOST	
'localhost:8020'
HTTP_REFERER	
'http://127.0.0.1:3007/'
HTTP_SEC_CH_UA	
'"Chromium";v="148", "Google Chrome";v="148", "Not/A)Brand";v="99"'
HTTP_SEC_CH_UA_MOBILE	
'?0'
HTTP_SEC_CH_UA_PLATFORM	
'"Windows"'
HTTP_SEC_FETCH_DEST	
'document'
HTTP_SEC_FETCH_MODE	
'navigate'
HTTP_SEC_FETCH_SITE	
'cross-site'
HTTP_SEC_FETCH_USER	
'?1'
HTTP_UPGRADE_INSECURE_REQUESTS	
'1'
HTTP_USER_AGENT	
('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like '
 'Gecko) Chrome/148.0.0.0 Safari/537.36')
PATH_INFO	
'/api/leadhunter/prospects/export.csv'
QUERY_STRING	
'search_id=51ee2455-1f49-4187-ab83-5de7931f54fc'
REMOTE_ADDR	
'172.18.0.1'
REMOTE_HOST	
'172.18.0.1'
REMOTE_PORT	
43090
REQUEST_METHOD	
'GET'
SCRIPT_NAME	
''
SERVER_NAME	
'172.18.0.2'
SERVER_PORT	
'8020'
wsgi.multiprocess	
True
wsgi.multithread	
True
Settings
Using settings module config.settings
Setting	Value
ABSOLUTE_URL_OVERRIDES	
{}
ADMINS	
[]
ALLOWED_HOSTS	
['127.0.0.1', 'localhost', '0.0.0.0', 'api-backend-python']
APPEND_SLASH	
True
ASGI_APPLICATION	
'config.asgi.application'
AUTHENTICATION_BACKENDS	
['django.contrib.auth.backends.ModelBackend']
AUTH_API_BASE_URL	
'********************'
AUTH_PASSWORD_VALIDATORS	
'********************'
AUTH_USER_MODEL	
'auth.User'
BASE_DIR	
PosixPath('/usr/src/api/leadhunter_gateway')
CACHES	
{'default': {'BACKEND': 'django.core.cache.backends.locmem.LocMemCache'}}
CACHE_MIDDLEWARE_ALIAS	
'default'
CACHE_MIDDLEWARE_KEY_PREFIX	
'********************'
CACHE_MIDDLEWARE_SECONDS	
600
CORS_ALLOWED_ORIGINS	
['http://localhost:3007', 'http://127.0.0.1:3007']
CORS_ALLOW_CREDENTIALS	
True
CSRF_COOKIE_AGE	
31449600
CSRF_COOKIE_DOMAIN	
None
CSRF_COOKIE_HTTPONLY	
False
CSRF_COOKIE_MASKED	
False
CSRF_COOKIE_NAME	
'csrftoken'
CSRF_COOKIE_PATH	
'/'
CSRF_COOKIE_SAMESITE	
'Lax'
CSRF_COOKIE_SECURE	
False
CSRF_FAILURE_VIEW	
'django.views.csrf.csrf_failure'
CSRF_HEADER_NAME	
'HTTP_X_CSRFTOKEN'
CSRF_TRUSTED_ORIGINS	
[]
CSRF_USE_SESSIONS	
False
DATABASES	
{'default': {'ATOMIC_REQUESTS': False,
             'AUTOCOMMIT': True,
             'CONN_HEALTH_CHECKS': False,
             'CONN_MAX_AGE': 0,
             'ENGINE': 'django.db.backends.postgresql',
             'HOST': 'db-postgresql',
             'NAME': 'comercial',
             'OPTIONS': {'options': '-c '
                                    'search_path="LeadHunterGateway",public'},
             'PASSWORD': '********************',
             'PORT': '5432',
             'TEST': {'CHARSET': None,
                      'COLLATION': None,
                      'MIGRATE': True,
                      'MIRROR': None,
                      'NAME': None},
             'TIME_ZONE': None,
             'USER': 'comercial_user'}}
DATABASE_ROUTERS	
[]
DATA_UPLOAD_MAX_MEMORY_SIZE	
2621440
DATA_UPLOAD_MAX_NUMBER_FIELDS	
1000
DATA_UPLOAD_MAX_NUMBER_FILES	
100
DATETIME_FORMAT	
'N j, Y, P'
DATETIME_INPUT_FORMATS	
['%Y-%m-%d %H:%M:%S',
 '%Y-%m-%d %H:%M:%S.%f',
 '%Y-%m-%d %H:%M',
 '%m/%d/%Y %H:%M:%S',
 '%m/%d/%Y %H:%M:%S.%f',
 '%m/%d/%Y %H:%M',
 '%m/%d/%y %H:%M:%S',
 '%m/%d/%y %H:%M:%S.%f',
 '%m/%d/%y %H:%M']
DATE_FORMAT	
'N j, Y'
DATE_INPUT_FORMATS	
['%Y-%m-%d',
 '%m/%d/%Y',
 '%m/%d/%y',
 '%b %d %Y',
 '%b %d, %Y',
 '%d %b %Y',
 '%d %b, %Y',
 '%B %d %Y',
 '%B %d, %Y',
 '%d %B %Y',
 '%d %B, %Y']
DB_SCHEMA	
'LeadHunterGateway'
DEBUG	
True
DEBUG_PROPAGATE_EXCEPTIONS	
False
DECIMAL_SEPARATOR	
'.'
DEFAULT_AUTO_FIELD	
'django.db.models.BigAutoField'
DEFAULT_CHARSET	
'utf-8'
DEFAULT_EXCEPTION_REPORTER	
'django.views.debug.ExceptionReporter'
DEFAULT_EXCEPTION_REPORTER_FILTER	
'django.views.debug.SafeExceptionReporterFilter'
DEFAULT_FILE_STORAGE	
'django.core.files.storage.FileSystemStorage'
DEFAULT_FROM_EMAIL	
'webmaster@localhost'
DEFAULT_INDEX_TABLESPACE	
''
DEFAULT_TABLESPACE	
''
DEVELOPMENT_MODE	
True
DISALLOWED_USER_AGENTS	
[]
EMAIL_BACKEND	
'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST	
'localhost'
EMAIL_HOST_PASSWORD	
'********************'
EMAIL_HOST_USER	
''
EMAIL_PORT	
25
EMAIL_SSL_CERTFILE	
None
EMAIL_SSL_KEYFILE	
'********************'
EMAIL_SUBJECT_PREFIX	
'[Django] '
EMAIL_TIMEOUT	
None
EMAIL_USE_LOCALTIME	
False
EMAIL_USE_SSL	
False
EMAIL_USE_TLS	
False
FILE_UPLOAD_DIRECTORY_PERMISSIONS	
None
FILE_UPLOAD_HANDLERS	
['django.core.files.uploadhandler.MemoryFileUploadHandler',
 'django.core.files.uploadhandler.TemporaryFileUploadHandler']
FILE_UPLOAD_MAX_MEMORY_SIZE	
2621440
FILE_UPLOAD_PERMISSIONS	
420
FILE_UPLOAD_TEMP_DIR	
None
FIRST_DAY_OF_WEEK	
0
FIXTURE_DIRS	
[]
FORCE_SCRIPT_NAME	
None
FORMAT_MODULE_PATH	
None
FORM_RENDERER	
'django.forms.renderers.DjangoTemplates'
IGNORABLE_404_URLS	
[]
INSTALLED_APPS	
['django.contrib.auth',
 'django.contrib.contenttypes',
 'django.contrib.sessions',
 'django.contrib.staticfiles',
 'rest_framework',
 'corsheaders',
 'gateway']
INTERNAL_IPS	
[]
LANGUAGES	
[('af', 'Afrikaans'),
 ('ar', 'Arabic'),
 ('ar-dz', 'Algerian Arabic'),
 ('ast', 'Asturian'),
 ('az', 'Azerbaijani'),
 ('bg', 'Bulgarian'),
 ('be', 'Belarusian'),
 ('bn', 'Bengali'),
 ('br', 'Breton'),
 ('bs', 'Bosnian'),
 ('ca', 'Catalan'),
 ('ckb', 'Central Kurdish (Sorani)'),
 ('cs', 'Czech'),
 ('cy', 'Welsh'),
 ('da', 'Danish'),
 ('de', 'German'),
 ('dsb', 'Lower Sorbian'),
 ('el', 'Greek'),
 ('en', 'English'),
 ('en-au', 'Australian English'),
 ('en-gb', 'British English'),
 ('eo', 'Esperanto'),
 ('es', 'Spanish'),
 ('es-ar', 'Argentinian Spanish'),
 ('es-co', 'Colombian Spanish'),
 ('es-mx', 'Mexican Spanish'),
 ('es-ni', 'Nicaraguan Spanish'),
 ('es-ve', 'Venezuelan Spanish'),
 ('et', 'Estonian'),
 ('eu', 'Basque'),
 ('fa', 'Persian'),
 ('fi', 'Finnish'),
 ('fr', 'French'),
 ('fy', 'Frisian'),
 ('ga', 'Irish'),
 ('gd', 'Scottish Gaelic'),
 ('gl', 'Galician'),
 ('he', 'Hebrew'),
 ('hi', 'Hindi'),
 ('hr', 'Croatian'),
 ('hsb', 'Upper Sorbian'),
 ('hu', 'Hungarian'),
 ('hy', 'Armenian'),
 ('ia', 'Interlingua'),
 ('id', 'Indonesian'),
 ('ig', 'Igbo'),
 ('io', 'Ido'),
 ('is', 'Icelandic'),
 ('it', 'Italian'),
 ('ja', 'Japanese'),
 ('ka', 'Georgian'),
 ('kab', 'Kabyle'),
 ('kk', 'Kazakh'),
 ('km', 'Khmer'),
 ('kn', 'Kannada'),
 ('ko', 'Korean'),
 ('ky', 'Kyrgyz'),
 ('lb', 'Luxembourgish'),
 ('lt', 'Lithuanian'),
 ('lv', 'Latvian'),
 ('mk', 'Macedonian'),
 ('ml', 'Malayalam'),
 ('mn', 'Mongolian'),
 ('mr', 'Marathi'),
 ('ms', 'Malay'),
 ('my', 'Burmese'),
 ('nb', 'Norwegian Bokmål'),
 ('ne', 'Nepali'),
 ('nl', 'Dutch'),
 ('nn', 'Norwegian Nynorsk'),
 ('os', 'Ossetic'),
 ('pa', 'Punjabi'),
 ('pl', 'Polish'),
 ('pt', 'Portuguese'),
 ('pt-br', 'Brazilian Portuguese'),
 ('ro', 'Romanian'),
 ('ru', 'Russian'),
 ('sk', 'Slovak'),
 ('sl', 'Slovenian'),
 ('sq', 'Albanian'),
 ('sr', 'Serbian'),
 ('sr-latn', 'Serbian Latin'),
 ('sv', 'Swedish'),
 ('sw', 'Swahili'),
 ('ta', 'Tamil'),
 ('te', 'Telugu'),
 ('tg', 'Tajik'),
 ('th', 'Thai'),
 ('tk', 'Turkmen'),
 ('tr', 'Turkish'),
 ('tt', 'Tatar'),
 ('udm', 'Udmurt'),
 ('uk', 'Ukrainian'),
 ('ur', 'Urdu'),
 ('uz', 'Uzbek'),
 ('vi', 'Vietnamese'),
 ('zh-hans', 'Simplified Chinese'),
 ('zh-hant', 'Traditional Chinese')]
LANGUAGES_BIDI	
['he', 'ar', 'ar-dz', 'ckb', 'fa', 'ur']
LANGUAGE_CODE	
'es-mx'
LANGUAGE_COOKIE_AGE	
None
LANGUAGE_COOKIE_DOMAIN	
None
LANGUAGE_COOKIE_HTTPONLY	
False
LANGUAGE_COOKIE_NAME	
'django_language'
LANGUAGE_COOKIE_PATH	
'/'
LANGUAGE_COOKIE_SAMESITE	
None
LANGUAGE_COOKIE_SECURE	
False
LEADHUNTER_API_BASE_URL	
'********************'
LEADHUNTER_APPLICATION_CODE	
'LEADHUNTER'
LOCALE_PATHS	
[]
LOGGING	
{}
LOGGING_CONFIG	
'logging.config.dictConfig'
LOGIN_REDIRECT_URL	
'/accounts/profile/'
LOGIN_URL	
'/accounts/login/'
LOGOUT_REDIRECT_URL	
None
MANAGERS	
[]
MEDIA_ROOT	
''
MEDIA_URL	
'/'
MESSAGE_STORAGE	
'django.contrib.messages.storage.fallback.FallbackStorage'
MIDDLEWARE	
['django.middleware.security.SecurityMiddleware',
 'corsheaders.middleware.CorsMiddleware',
 'django.contrib.sessions.middleware.SessionMiddleware',
 'django.middleware.common.CommonMiddleware']
MIGRATION_MODULES	
{}
MONTH_DAY_FORMAT	
'F j'
NUMBER_GROUPING	
0
PASSWORD_HASHERS	
'********************'
PASSWORD_RESET_TIMEOUT	
'********************'
PREPEND_WWW	
False
PROJECT_NAME	
'LeadHunterGateway'
REST_FRAMEWORK	
{'DEFAULT_AUTHENTICATION_CLASSES': [],
 'DEFAULT_PERMISSION_CLASSES': ['rest_framework.permissions.AllowAny']}
ROOT_URLCONF	
'config.urls'
SECRET_KEY	
'********************'
SECRET_KEY_FALLBACKS	
'********************'
SECURE_CONTENT_TYPE_NOSNIFF	
True
SECURE_CROSS_ORIGIN_OPENER_POLICY	
'same-origin'
SECURE_HSTS_INCLUDE_SUBDOMAINS	
False
SECURE_HSTS_PRELOAD	
False
SECURE_HSTS_SECONDS	
0
SECURE_PROXY_SSL_HEADER	
None
SECURE_REDIRECT_EXEMPT	
[]
SECURE_REFERRER_POLICY	
'same-origin'
SECURE_SSL_HOST	
None
SECURE_SSL_REDIRECT	
False
SERVER_EMAIL	
'root@localhost'
SESSION_CACHE_ALIAS	
'default'
SESSION_COOKIE_AGE	
1209600
SESSION_COOKIE_DOMAIN	
None
SESSION_COOKIE_HTTPONLY	
True
SESSION_COOKIE_NAME	
'sessionid'
SESSION_COOKIE_PATH	
'/'
SESSION_COOKIE_SAMESITE	
'Lax'
SESSION_COOKIE_SECURE	
False
SESSION_ENGINE	
'django.contrib.sessions.backends.db'
SESSION_EXPIRE_AT_BROWSER_CLOSE	
False
SESSION_FILE_PATH	
None
SESSION_SAVE_EVERY_REQUEST	
False
SESSION_SERIALIZER	
'django.contrib.sessions.serializers.JSONSerializer'
SETTINGS_MODULE	
'config.settings'
SHORT_DATETIME_FORMAT	
'm/d/Y P'
SHORT_DATE_FORMAT	
'm/d/Y'
SIGNING_BACKEND	
'django.core.signing.TimestampSigner'
SILENCED_SYSTEM_CHECKS	
[]
STATICFILES_DIRS	
[]
STATICFILES_FINDERS	
['django.contrib.staticfiles.finders.FileSystemFinder',
 'django.contrib.staticfiles.finders.AppDirectoriesFinder']
STATICFILES_STORAGE	
'django.contrib.staticfiles.storage.StaticFilesStorage'
STATIC_ROOT	
None
STATIC_URL	
'/static/'
STORAGES	
{'default': {'BACKEND': 'django.core.files.storage.FileSystemStorage'},
 'staticfiles': {'BACKEND': 'django.contrib.staticfiles.storage.StaticFilesStorage'}}
TEMPLATES	
[]
TEST_NON_SERIALIZED_APPS	
[]
TEST_RUNNER	
'django.test.runner.DiscoverRunner'
THOUSAND_SEPARATOR	
','
TIME_FORMAT	
'P'
TIME_INPUT_FORMATS	
['%H:%M:%S', '%H:%M:%S.%f', '%H:%M']
TIME_ZONE	
'America/Mexico_City'
USE_DEPRECATED_PYTZ	
False
USE_I18N	
True
USE_L10N	
True
USE_THOUSAND_SEPARATOR	
False
USE_TZ	
True
USE_X_FORWARDED_HOST	
False
USE_X_FORWARDED_PORT	
False
WSGI_APPLICATION	
'config.wsgi.application'
X_FRAME_OPTIONS	
'DENY'
YEAR_MONTH_FORMAT	
'F Y'
You’re seeing this error because you have DEBUG = True in your Django settings file. Change that to False, and Django will display a standard page generated by the handler for this status code.



otra cosa como sabré que necios son de Google maps ?