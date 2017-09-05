FROM gcr.io/google-containers/exechealthz-amd64:v1.2.0

USER root:root

RUN apk add --no-cache curl && \
    curl -L https://storage.googleapis.com/kubernetes-release/release/v1.7.5/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && kubectl version --client

COPY kube-scheduler-healthcheck /usr/local/bin/

CMD ["-port=8090", "-period=60s", "-latency=120s", "-cmd=/usr/local/bin/kube-scheduler-healthcheck" ]
