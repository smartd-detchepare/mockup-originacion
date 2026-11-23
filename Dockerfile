# Sitio estático del Mantenedor de filtros servido con nginx en Cloud Run
FROM nginx:1.27-alpine

# Cloud Run inyecta PORT (por defecto 8080). La imagen oficial de nginx
# procesa /etc/nginx/templates/*.template con envsubst al arrancar.
ENV PORT=8080

RUN rm -f /etc/nginx/conf.d/default.conf
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

COPY index.html /usr/share/nginx/html/index.html
COPY images/ /usr/share/nginx/html/images/

EXPOSE 8080
