FROM node:16-alpine
  
RUN apk --no-cache add yarn git bash && \
    # npm uses SSH to get code from github.
    # We use https instead to skip the manual ssh fingerprint acceptance.
    git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git:// && \
    git config --global url."https://".insteadOf ssh:// && \
    # Install missing deps
    npm install --global merge-descriptors
    
RUN echo "IMAGE INFORMATION" > KTH_OS
RUN echo "Alpine version: `cat /etc/alpine-release `" >> KTH_OS
RUN echo "Build date: `date`" >> KTH_OS

RUN echo "IMAGE INFORMATION" > KTH_NODEJS
RUN echo "Based on:  node:16-alpine " >> KTH_NODEJS
RUN echo "Build date: `date`" >> KTH_NODEJS
RUN echo "Node: `node --version`" >> KTH_NODEJS
RUN echo "NPM: `npm --version`" >> KTH_NODEJS
RUN echo "Yarn: `yarn --version`" >> KTH_NODEJS
RUN echo "" >> KTH_NODEJS
RUN echo "--- Default global packages ---" >> KTH_NODEJS
RUN echo "`npm list -g --depth 0`" >> KTH_NODEJS

RUN cat KTH_OS
RUN cat KTH_NODEJS