FROM alpine:latest
RUN apk --no-cache --update add bash wget tar libc6-compat

ADD ./ .
RUN chmod 777 /app
RUN chmod 777 /app/start.sh
RUN mkdir /ocp-tools
RUN wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable-4.6/openshift-client-linux.tar.gz -P /ocp-tools
#RUN wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable-4.6/openshift-install-linux.tar.gz -P /ocp-tools

RUN ls -la /ocp-tools
RUN chmod 777 /ocp-tools
RUN cd /ocp-tools
RUN chmod 777 /ocp-tools/*
#RUN tar xvf openshift-install-linux.tar.gz openshift-install
RUN tar xvf /ocp-tools/openshift-client-linux.tar.gz oc kubectl
RUN cp oc kubectl /usr/local/bin

RUN mkdir /.kube
RUN chmod 777 /.kube



ENTRYPOINT ["/app/start.sh"]


