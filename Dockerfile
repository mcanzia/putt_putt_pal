FROM dart:stable as build-stage
WORKDIR /app
COPY pubspec.* ./
RUN dart pub get
COPY . .
RUN apt-get update && apt-get install -y unzip xz-utils zip libglu1-mesa
RUN curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.7.0-stable.tar.xz
RUN tar xf flutter_linux_3.7.0-stable.tar.xz
ENV PATH "$PATH:/app/flutter/bin"
RUN flutter doctor -v
RUN flutter build web

FROM nginx:stable as production-stage
RUN mkdir /app
COPY --from=build-stage /app/build/web /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
