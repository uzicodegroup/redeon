#!/usr/bin/env bash

#CRIADO POR: RAMONE, UZI
#VERSÃO: 1.0
#ANO DE CRIAÇÃO: 2021
#FUNÇÃO: DESATIVAR MODO MONITOR
#EXCLUSIVO DA UZICODE HACKING (C)

#ROOT==========================================
(($USER != "root")) && { echo -e "\e[31;1mFAVOR ENTRE COM USUARIO ROOT!!!" ; exit 1 ;}
#==============================================

#AJUDA=========================================
if [[ $1 == "--help" ]]
then
cat << EOF
	Para iniciar copie o nome de sua placa que aparecera isolada no canto esquerdo de sua tela
	como por exemplo "wlan0" "wlan1"...
	Cole no campo que vem a seguir e aguarde sua conexão ser restabelecida...
	
	Uzicode (c) 2021
	Acesse para mais conteúdo: http://www.github.com/uzicode21	
EOF
exit 0
fi

#COR===========================================
rx="\e[35;1m"
vm="\e[31;1m"
vd="\e[32;1m"
lr="\e[33;1m"
az="\e[34;1m"
br="\e[37;1m"
azz="\e[36;1m"
cl="\e[m"
#===============================================
clear
echo -e "${rx}`cat bann.txt`${cl}"
sleep 3s
clear

#ELIMINANDO PLACAS==============================
	echo -e "${vm}\tEXECUTANDO IFCONFIG...${cl}"
	sleep 2s

	ifconfig
	sleep 2s
	
	read -p $'\tEntre com o nome de sua placa listado acima: ' placadel
	iw $placadel del
	echo -e "${vm}\t$placadel Removida!!! ${cl}"
	clear
	
#=================================================
service NetworkManager stop	#INTERROMPENDO NETWORK
	sleep 2s
	
echo -e "${vd}\tINICIANDO IW PHY...${cl}"
iw phy0 interface add wlan0 type managed &>/dev/null
	sleep 2s
	
echo -e "${vd}\tCRIANDO INTERFACE WLAN0...${cl}"
ifconfig wlan0 up
	sleep 2s
	
echo -e "${vd}\tVERIFICANDO SE EXISTE WLAN0...${cl}"	
sleep 3s
echo -e "${vd}\t$(ifconfig | grep -o 'wlan0') esta funcionando corretamente!!! ${cl}" 
sleep 3s

service NetworkManager start
echo -e "${vd}\tConexão restaurada com sucesso!!!${cl}" 
sleep 3s
clear
echo -e "${rx}\tFerramenta desenvolvida por: Ramone e Uzi (c) ${cl}" 

