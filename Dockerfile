FROM instrumentisto/flutter as build-stage
WORKDIR /app
COPY pubspec.* ./
RUN flutter pub get
COPY . .
RUN flutter build web

FROM nginx:stable as production-stage
RUN mkdir /app
COPY --from=build-stage /app/build/web /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
