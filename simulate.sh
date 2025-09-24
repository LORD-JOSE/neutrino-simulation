$ #!/bin/bash

# arranque en milisegundos
start=$(date +%s%3N)

# limpiar archivos anteriores
rm -f results.txt performance.txt
rm -f *.txt

# crear 1000 archivos con fecha y neutrinos detectados
for i in $(seq -w 1 1000)
do
    t=$(date +"%Y-%m-%d %H:%M:%S")
    n=$((RANDOM % 11))
    echo "$t $n" > "$i.txt"
done

# juntar todo en un solo archivo
cat *.txt > results.txt

# fin en milisegundos
end=$(date +%s%3N)
total_us=$((end - start))

# promedio entero en milisegundos
promedio_us=$((total_us / 1000))

# guardar resultados
echo "tiempo total: $total_us milisegundos" > performance.txt
echo "tiempo promedio por evento: $promedio_us milisegundos" >> performance.txt
