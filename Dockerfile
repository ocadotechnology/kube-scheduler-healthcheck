FROM gcr.io/google-containers/exechealthz-amd64:v1.2.0

USER root:root

RUN apk add --no-cache curl && \
    curl -L https://storage.googleapis.com/kubernetes-release/release/1.7.4/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl

COPY kube-scheduler-healthcheck /usr/local/bin/

CMD ["-port=8080", "-period=60s", "-latency=120s", "-cmd=/usr/local/bin/kube-scheduler-healthcheck" ]
