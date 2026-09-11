FROM httpd:2.4

RUN sed -i \
    -e 's/^#LoadModule proxy_module/LoadModule proxy_module/' \
    -e 's/^#LoadModule proxy_http_module/LoadModule proxy_http_module/' \
    /usr/local/apache2/conf/httpd.conf \
    && printf '\nInclude conf/extra/ths-proxy.conf\n' \
    >> /usr/local/apache2/conf/httpd.conf

COPY ths-proxy.conf /usr/local/apache2/conf/extra/ths-proxy.conf