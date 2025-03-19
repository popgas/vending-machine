#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

printf "${RED}Deseja realmente realizar o deploy em produção? ${NC}Digite ${GREEN}sim${NC} para continuar.\n"
read yn

if [[ "$yn" != "sim" ]] ;then
    echo "Deploy cancelado!"
    exit;
fi

bucket_name="maquina-24h.popgas.com.br"

printf "${GREEN}Iniciando deploy em produção...\n"
printf "${GREEN}Compilando aplicação...\n${NC}"
flutter build web

printf "${GREEN}Enviando aplicação para AWS S3...\n"

export AWS_DEFAULT_PROFILE=popgas

aws s3 cp --profile popgas ./build/web/ s3://${bucket_name}/ --recursive

aws cloudfront --profile popgas create-invalidation --distribution-id E2BNTKV792L07 --paths "/*"

printf "${GREEN}Deploy finalizado!\n"