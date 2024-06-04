#!/bin/bash
function suma {
        a=$1 #atribuie variabilei a valoarea altei variabile
        b=$2
        c=$(($a + $b)) #atribuie variabilei c valoarea returnată de suma numerelor
        echo "Suma este: $c" #valoarea argumentului c
}
function produs {
        a=$1
        b=$2
        c=$(($a * $b)) #atribuie variabilei c valoarea returnata de produsul numerelor
        echo "Produsul este: $c"
}
function diferenta {
        a=$1
        b=$2
        c=$(($a - $b)) #atribuie variabilei c valoarea returnata de diferenta nr
        echo "Diferenta este: $c"
}
function impartire {
        a=$1
        b=$2
        c=$(($a / $b)) #atribuie variabilei c valoarea returnata de impartirea nr
        echo "Catul este: $c"
}
function meniu1 {
        echo ""
        echo "     Meniu pentru calculul a doua numere "
        echo "--------------------------------------------"
        echo "1. Suma a 2 numere"
        echo "2. Diferenta a 2 numere"
        echo "3. Produsul a 2 numere"
        echo "4. Catul a 2 numere"
}
function optiunea_0 {
while true; do
        meniu1
        read -p " Alege o operatie: " numere

        case $numere in
        1)
                echo -n "a=" #citeste numarul si tine cursorul pe aceeasi linie
                read a
                echo -n "b="
                read b
                suma $a $b #apelam functia suma atribuind numerele a si b citite de la tastatura numerelor din functie
                break;;
        2)
                echo -n "a="
                read a
                echo -n "b="
                read b
                diferenta $a $b
                break;;
        3)
                echo -n "a="
                read a
                echo -n "b="
                read b
                produs $a $b
                break;;
        4)
                echo -n "a="
                read a
                echo -n "b="
                read b
                impartire $a $b
                break;;
        *)
                echo "Optiune invalida. Incercati iar";;
        esac
done
}
function optiunea_1 {
        echo ""
        echo "Ai ales optiunea prin care se compara un numar cu 0"
        echo ""
        echo -n "Introduceti valoarea variabilei var1: "
        read var1 #citirea variabilei de la tastatura
        if [ $var1 -eq 0 ] #verificam daca nr introdus este egal cu 0 prin comanda -eq
        then
                echo "$var1 este egal cu 0"
        elif [ $var1 -lt 0 ] #daca este mai mic prin comanda -lt
        then
                echo "$var1 este mai mic decat 0"
        else
                echo "$var1 este mai mare decat 0"
        fi
}
function optiunea_2 {
        echo ""
        echo "Ai ales optiunea prin care se verifica daca nr introdus se gaseste intr-o lista data"
        echo ""
        echo -n "Introduceti valoarea variabilei var1: "
        read var1
        case $var1 in
                1)
                        echo "var1=1";; #verifcam daca nr introdus este 1
                2)
                        echo "var1=2";;
                3)
                        echo "var1=3";;
                *)
                        echo "var1 nu este in lista de valori";;
        esac
}
function optiunea_3 {
        echo ""
        echo "Ai ales optiunea prin care se afiseaza nr de fisiere si de directoare din directorul curent"
        echo ""
        lista=$( ls ) #la lista i se atribuie toate datele din comanda ls
        #initiem cu 0 fisierele si directoarele pentru a putea fi numarate
        fisiere=0
        directoare=0
        #cautam in lista
        for nume in $lista
        do
                if [ -f $nume ] #daca documentele gasite sunt fisiere
                then
                        let "fisiere=fisiere+1"
                fi
                if [ -d $nume ] #daca documentele gasite sunt documente
                then
                        let "directoare=directoare+1"
                fi
        done
        echo "Numarul de fisiere: $fisiere"
        echo "Numarul de directoare: $directoare"
}
function optiunea_4 {
        echo "Ai ales optiunea prin care se creeaza N fisiere cu un anumit nume"
        echo -n "Introduceti numele fisierului: "
        read nume
        echo -n "Introduceti numarul de fisiere: "
        read numar
        i=0
        while [ $i -le $numar ] #cat timp i este mai mic a nr introdus de noi
        do
                fisier=${nume}.$i #dam numele la fisier dupa sintaxa din enunt
                touch $fisier #cream fisierul
                let "i=i+1" #incrementam i, pentru a crea toate fisierele
        done
        echo "Fisierele au fost create"
        ls ${nume}.* #afisam fisierele

}
function optiunea_5 {
        echo ""
        echo "Ai ales optiunea de a afisa data si ora"
        echo ""
        echo "Data este: "
        date +%d.%m.%Y
        echo "Ora este: "
        date +%H:%M:%S
}
function optiunea_6 {
        echo ""
        echo "Ati ales optiunea de a sterge un fisier"
        echo ""
        echo "Introduceti numele fisierului: "
        read val
        if [ ! -f "$val" ]; then
                echo "Fisierul '$val' nu exista"
                exit 1
        else
                rm "$val"
                echo "Fisierul '$val' a fost sters"
        fi
}
function optiunea_7 {
        echo -n "Introduceti fisierul ce doriti sa-l mutati: "
        read source
        echo -n "Introduceti directorul unde doriti sa-l mutati: "
        read destination

        # Mutarea fișierului
        mv $source $destination
        # Verificare mutare fisier
        cd $destination
        if [ -f $source ]; then
                echo "Fișierul a fost mutat"
        else
                echo "Fisierul nu a fost mutat"
        fi
        echo ""
        echo -n "Doriti listarea continutului?1/0 "
        read opt
        if [ $opt -eq 1 ]; then
                echo "Listarea continutului directorului"
                ls -l
        else
                break
        fi
}
function afiseaza_meniu {
        echo ""
        echo "                                 Meniu"
        echo "---------------------------------------------------------------------------"
        echo "[0]. Calcul de  numere(produs,suma,diferenta,impartire) folosind functii"
        echo "[1]. Verifica daca numarul introdus este mai mare,mai mic sau egal cu 0"
        echo "[2]. Verifica daca numarul introdus se afla in lista"
        echo "[3]. Afiseaza numarul de fisiere si de directoare din directorul curent"
        echo "[4]. Creeaza N fisiere dupa un format dat de la tastatura"
        echo "[5]. Afiseaza data si ora dupa formatul ZZ.LL.AAAA ora:min:sec"
        echo "[6]. Stergerea unui fisier"
        echo "[7]. Mutare fisier"
        echo "[8]. Exit"
        echo ""
}

while true;do
        afiseaza_meniu
        read -p "Alege o optiune: " alegere

        case $alegere in
        0)
                optiunea_0
                ;;
        1)
                optiunea_1
                ;;

        2)
                optiunea_2;;
        3)
                optiunea_3;;
        4)
                optiunea_4;;
        5)
                optiunea_5;;
        6)
                optiunea_6;;

        7)
                optiunea_7;;
        8)
                echo "La revedere"
                break
                ;;
        *)
                echo "Optiune invalida.Mai incearca"
                ;;
        esac
done
