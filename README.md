# meteor Docker base image

>> NOTE: currently based on node:4.8.7

Used as the base image to build and run a meteor app.

for example:

```
FROM onaci/meteor

COPY --chown=meteor:meteor . /app/
COPY --chown=meteor:meteor .meteor/ /app/.meteor/

ENV METEOR_PROFILE=1
ENV METEOR_DEBUG_BUILD=1

RUN meteor list
RUN meteor npm install

# https://github.com/meteor/meteor/issues/4284#issuecomment-115211652
CMD METEOR_PROFILE=1 METEOR_DEBUG_BUILD=1 meteor | tee run.log

HEALTHCHECK CMD wget http://localhost:3000/ || exit 1
```
