
# the closest version to 4.8.4
# see https://hub.docker.com/_/node/
FROM node:4.8.7

# for mongodb: https://github.com/tianon/docker-brew-debian/issues/45#issuecomment-250370410
ENV LC_ALL=C.UTF-8

RUN apt-get update \
    && apt-get install -yq vim-tiny mongodb 

RUN adduser --system --group meteor --home /home/meteor \
    && mkdir -p /app/.meteor/ \
    && chown -R meteor:meteor /app
USER meteor

# installing globally seems to cause issues
RUN curl "https://install.meteor.com/?release=" | sh \
    && echo "export PATH=$HOME/.meteor:$PATH" >> ~/.bashrc

ENV PATH=/home/meteor/.meteor:${PATH}

RUN npm --version \
    && meteor --version

WORKDIR /app
CMD meteor

# just add the package.json to minimise re-installs
#ONBUILD COPY --chown=meteor:meteor package.json /app/
#ONBUILD RUN npm install

#ONBUILD COPY --chown=meteor:meteor . /app/
#ONBUILD COPY --chown=meteor:meteor .meteor/ /app/.meteor/
#ONBUILD RUN meteor list \
#            && meteor npm install

#RUN ln -s /usr/local/bin/meteor /app/.meteor/meteor


# I don't know why this keeps getting linkes to something in /root : /root/.meteor/packages/meteor-tool/1.5.2/mt-os.linux.x86_64/dev_bundle
#ONBUILD RUN rm -f /app/local/dev_bundle

#ONBUILD RUN npm --version \
#    && meteor --version
