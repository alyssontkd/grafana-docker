ARG GRAFANA_VERSION="5.3.2"

FROM grafana/grafana:${GRAFANA_VERSION}

#USER root

ARG GF_INSTALL_PLUGINS=""

RUN if [ ! -z "${GF_INSTALL_PLUGINS}" ]; then \
    OLDIFS=$IFS; \
        IFS=','; \
    for plugin in ${GF_INSTALL_PLUGINS}; do \
        IFS=$OLDIFS; \
        grafana-cli --pluginsDir "$GF_PATHS_PLUGINS" plugins install ${plugin}; \
    done; \
fi

#RUN chmod -R 777 /etc/grafana 
#RUN chown -R grafana:grafana /etc/grafana && \
#  chmod -R a+r /etc/grafana && \
#  chown -R grafana:grafana /var/lib/grafana && \
#  chmod -R 777 /var/lib/grafana

USER grafana
