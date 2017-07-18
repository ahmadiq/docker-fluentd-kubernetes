FROM ahmadiq/fluentd:v0.14

MAINTAINER Ahmad Iqbal Ali <ahmadiq@gmail.com>

ENV ELASTICSEARCH_HOST es-logging.default.svc

RUN gem install fluent-plugin-kubernetes_metadata_filter -v 0.26.2 \
 && gem install fluent-plugin-elasticsearch -v 1.9.5 \
 && gem install fluent-plugin-prometheus -v 0.2.1 \
 && gem cleanup fluentd

ADD start-fluentd /start-fluentd

ENTRYPOINT ["/start-fluentd"]
