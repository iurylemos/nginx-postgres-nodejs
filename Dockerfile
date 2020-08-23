FROM node:carbon
# DEFININDO ONDE A APLICAÇÃO VAI FICAR DENTRO DA IMAGEM
WORKDIR /usr/src/app
# COPIANDO CONTEÚDO PARA DENTRO DA IMAGEM
COPY crud-node-postgres/package*.json ./
# INSTALANDO DEPEDÊNCIAS
RUN npm install
# COPIANDO TODO O PROJETO PARA DENTRO DA IMAGEM
COPY ./crud-node-postgres/ .
RUN npm install -g bower
COPY crud-node-postgres/bower*.json ./
RUN bower install --allow-root
EXPOSE 3090
CMD ["node", "server.js"]