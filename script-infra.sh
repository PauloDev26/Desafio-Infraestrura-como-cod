#!/bin/bash

# Removendo estruturas anteriores 
echo "Limpando estruturas anteriores..."
rm -rf /publico /adm /ven /sec
groupdel GRP_ADM GRP_VEN GRP_SEC 2>/dev/null
userdel -r carlos maria joao_ debora sebastiana roberto josefina amanda rogerio 2>/dev/null

# Criando diretórios
echo "Criando diretórios..."
mkdir /publico /adm /ven /sec

# Criando os grupos
echo "Criando grupos..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

# Criando os usuários e associando aos grupos
echo "Criando usuários..."
useradd carlos -c "Carlos" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd maria -c "Maria" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd joao_ -c "João" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM

useradd debora -c "Débora" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd sebastiana -c "Sebastiana" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd roberto -c "Roberto" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN

useradd josefina -c "Josefina" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd amanda -c "Amanda" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd rogerio -c "Rogério" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC

# Configuração de permissões
echo "Configurando permissões..."
chown root:root /publico /adm /ven /sec

# Permissão total para todos no /publico
chmod 777 /publico

# Permissões específicas para cada diretório
# /adm: total para o grupo, leitura e execução para outros

chmod 770 /adm
chown root:GRP_ADM /adm

chmod 770 /ven
chown root:GRP_VEN /ven

chmod 770 /sec
chown root:GRP_SEC /sec

echo "Provisionamento concluído com sucesso!"