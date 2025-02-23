- [Astrazione, disciplina e le tre y](#astrazione-disciplina-e-le-tre-y)
  - [Astrazione digitale](#astrazione-digitale)
- [I sistemi numerici](#i-sistemi-numerici)
  - [Il sistema decimale](#il-sistema-decimale)
    - [Conversione da base b a decimale](#conversione-da-base-b-a-decimale)
    - [Conversione da decimale a base b](#conversione-da-decimale-a-base-b)
  - [Il sistema binario](#il-sistema-binario)
    - [Conversione da binario a base b](#conversione-da-binario-a-base-b)
    - [Conversione da una base b a binario](#conversione-da-una-base-b-a-binario)
    - [Complemento a 2](#complemento-a-2)
    - [Somma e sottrazione binaria](#somma-e-sottrazione-binaria)
  - [Altre basi utili](#altre-basi-utili)
- [Porte logiche](#porte-logiche)
  - [Porte a un ingresso](#porte-a-un-ingresso)
  - [Porte a due o più ingressi](#porte-a-due-o-più-ingressi)
    - [Porta XOR](#porta-xor)
- [Transistor CMOS](#transistor-cmos)

---

# Astrazione, disciplina e le tre y

L'**astrazione** consiste nel nascondere i dettagli non essenziali per mettere in evidenza gli elementi chiave di un sistema, che può essere analizzato a diversi livelli, ciascuno concentrato su aspetti specifici.

Per lavorare in modo più efficiente a livelli più alti di astrazione, si applica la **disciplina**, che limita intenzionalmente le scelte progettuali, rendendo il processo più produttivo.

In questo contesto, la **microarchitettura** svolge un ruolo fondamentale, collegando la logica con l'architettura del calcolatore e traducendo il modello teorico in implementazioni hardware che eseguono le istruzioni in base al punto di vista del programmatore.

Quando si lavora a un determinato livello di astrazione, è utile conoscere i livelli immediatamente superiore e inferiore per comprendere meglio il contesto e l'interazione tra i diversi strati del sistema.

![Computer-Architecture-Layers-Of-Abstraction](https://www.learncomputerscienceonline.com/wp-content/uploads/2022/04/Computer-Architecture-Layers-Of-Abstraction.jpg)

Oltre all'astrazione ci sono altre tre tecniche fondamentali (dette le tre y):

- **Gerarchia:** Divisione di un sistema in moduli in maniera ricorsiva, fino a raggiungere pezzi facili da comprendere.
- **Modularità:** Implementazione dei moduli in maniera tale che abbiano funzioni e interfacce ben de­finite.
- **Regolarità:** Uniformità tra i moduli.

## Astrazione digitale

Una prima astrazione che viene fatta è quella di passare dai sistemi **analogici**, che possono assumere **valori infiniti**, a quelli **digitali**, che possono rappresentare solo **valori discreti**.

Uno dei primi sistemi digitali che utilizzava le variabili con **10** diversi valo­ri era il Motore Analitico di **Charles Babbage**. Babbage ci lavorò dal **1834** fino al **1871**, progettando e tentando di costruire questo calcolatore meccanico.

A differenza della macchina di
Babbage, la maggior parte dei calcolatori elettronici utilizza una rappresenta­
zione binaria, più facile da distinguere (Due sole tensioni: 0 e 5V). **George Boole** ha sviluppato una logica che opera su variabili bina­rie, nota come **logica Booleana**.

Un programmatore può scrivere codice senza conoscere i dettagli specifici dell'hardware, ma comprendere tali dettagli consente di ottimizzare il software per quel calcolatore.

---

# I sistemi numerici

Un generico **sistema numerico posizionale** è composto da:

- **base (b):** Indica il numero delle **cifre** del sistema numerico;
- **cifre (c):** Simboli del sistema numerico con valore compreso tra $[0;b-1]$. Possono essere combinate per ottenere valori maggiori, dove **$c_i$** indica la cifra in posizione i.
- **peso (i):** il peso è il valore associato alla posizione i ed aumenta spostandosi verso sinistra.

## Il sistema decimale

### Conversione da base b a decimale

Il valore in decimale della cifra **c**, in posizione **i**, è uguale a:

$$c_i = c\cdot b^i$$

Quindi dato **$n_b$**, un numero in **base b** di **k cifre**, il suo valore in decimale è:

$$n_{10}=\sum_{i=0}^{k-1}{c_i\cdot b^i}$$

### Conversione da decimale a base b

La formula precedente consente di convertire un numero scritto in qualunque base in un numero decimale.
Tuttavia, per fare l'opposto, non basta una formula ma serve un procedimento ricorsivo:

Sia **i** l'i-esimo passo del procedimento che va avanti fino a che **$n_{10}$** non è uguale a **0** e la posizione della cifra **c**, allora:

$$
n_{i|10}=\begin{cases}
  n_{10} & i=0\\
  \lfloor\frac{n_{i-1|10}}{b}\rfloor & i>0
\end{cases}
$$

$$c_{i|b} = {n_{i|10}\bmod b}$$

$$n_b=\sum_{i\in I} c_i\cdot 10^i$$

## Il sistema binario

### Conversione da binario a base b

...

### Conversione da una base b a binario

...

### Complemento a 2

...

### Somma e sottrazione binaria

...

## Altre basi utili

- **Ottale** $[0:7]$;
- **Esadecimale** $[0;9]\cup[A;F]$: Usato principalmente per la gestione dei colori RGB.

# Porte logiche

## Porte a un ingresso

| A   | BUF | NOT      |
| --- | --- | -------- |
|     |     | $\neg A$ |
| 0   | 0   | 1        |
| 1   | 1   | 0        |

## Porte a due o più ingressi

| A   | B   | AND        | OR        | XOR         |
| --- | --- | ---------- | --------- | ----------- |
|     |     | $A\land B$ | $A\lor B$ | $A\oplus B$ |
| 0   | 0   | 0          | 0         | 0           |
| 0   | 1   | 0          | 1         | 1           |
| 1   | 0   | 0          | 1         | 1           |
| 1   | 1   | 1          | 1         | 0           |

![](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fas1.ftcdn.net%2Fv2%2Fjpg%2F05%2F02%2F63%2F52%2F1000_F_502635240_S7hotQTlARZJiY3s7S9bkqlQSsUI5R33.jpg&f=1&nofb=1&ipt=392ab8da7b6b678d21fe31115eed59b4b0105b2d0538591416fb638cde166196&ipo=images)

### Porta XOR

La porta **XOR** può essere costruita con le **AND** e le **OR** nel seguente modo:

$$A\oplus B = \overline{A}\cdot B+A\cdot\overline{B}$$

![](/src/xor.drawio.svg)

```verilog
module XOR(output c, input a, input b);
    assign
        c = (!a && b) || (a && !b);
endmodule
```

In verilog la xor si può fare direttamente con il simbolo ^.

# Transistor CMOS

...
