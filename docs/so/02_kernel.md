Gli **obiettivi di protezione** descritti nel capitolo precedente sono implementati nel **Kernel**, una componente
essenziale di ogni sistema operativo.

In particolare, il Kernel rappresenta il livello più basso del software in esecuzione sul sistema ed è l'unico
componente con pieno accesso a tutte le risorse hardware della macchina.

Questo ci porta alla definizione di **processo**: un'astrazione fornita dal Kernel per garantire l'esecuzione protetta
di un'applicazione. Il Kernel media e controlla l'accesso di ogni processo all'hardware e, per facilitare questo
compito, è fondamentale una buona progettazione dell'hardware.

# L'astrazione del processo

Più nel dettaglio, un **processo** è un'istanza di un programma in esecuzione con diritti limitati, ossia una copia del
programma in memoria a cui il sistema operativo aggiunge:

-   un'area di memoria dedicata allo stato delle variabili locali, detta **stack**;
-   un'altra area di memoria per contenere le strutture allocate dinamicamente, detta **heap**.

Ovviamente, un programma può avere più di un'istanza in esecuzione sulla stessa macchina. Ogni processo dispone di uno
**stack** e di un **heap** separati, garantendo così l'isolamento tra le diverse istanze.

Il sistema operativo tiene traccia dei vari processi sul computer utilizzando una struttura dati chiamata **Process
Control Block (PCB)**. Il **PCB** memorizza tutte le informazioni necessarie al sistema operativo per gestire un
determinato processo.

Un **processo**, a sua volta, può contenere più **thread**. I **thread** sono unità di esecuzione all'interno di un
processo che condividono lo stesso spazio di indirizzamento, comprese le aree **heap** e le risorse allocate dal
processo, ma dispongono di un proprio **stack**.

# Funzionamento a doppia modalità

Il modo più semplice e sicuro per implementare un controllo sul codice di un processo sarebbe quello di utilizzare un
interprete che esamini istruzione per istruzione i processi in esecuzione. Tuttavia, questo approccio avrebbe un impatto
significativo sulle prestazioni.

Per questo motivo, il metodo adottato consiste nell'aggiungere un **bit di modalità** al processore, il quale indica in
quale stato si trova la CPU:

-   **Modalità utente (user mode)**: il processo in esecuzione ha privilegi limitati e può accedere solo a una parte
    delle risorse del sistema, come la memoria di spazio utente e le istruzioni non privilegiate. Se tenta di eseguire
    operazioni critiche, come l'accesso diretto all'hardware o la modifica di aree di memoria riservate, il sistema
    operativo interviene generando un'**eccezione** o un **trap**, impedendo l'operazione.
-   **Modalità kernel (privileged mode o supervisor mode)**: il sistema operativo ha il pieno controllo della macchina e
    può eseguire istruzioni privilegiate, come la gestione della memoria, l'accesso ai dispositivi hardware e la
    modifica dei registri di controllo del processore.

Quando un processo in modalità utente deve eseguire un'operazione privilegiata, deve effettuare una **chiamata di
sistema (system call)**, un meccanismo che permette di passare temporaneamente alla modalità kernel affinché il sistema
operativo possa eseguire l'operazione richiesta in sicurezza.

Questo meccanismo di separazione tra modalità utente e modalità kernel garantisce la protezione del sistema, impedendo
ai processi di accedere direttamente alle risorse critiche e prevenendo eventuali comportamenti dannosi o involontari.

![schema doppia modalità](./img/double_mode_scheme.png)

Il Kernel è solo una parte del sistema operativo, il restante viene eseguito in **user mode** come libreria collegata a
ciascuna applicazione. Queste librerie, che contengono funzioni di livello più alto rispetto al Kernel, offrono servizi
e interfacce che permettono alle applicazioni di interagire con il sistema operativo senza dover accedere direttamente
alle risorse hardware.

Ciò viene fatto anche perché il codice eseguito in **user mode** è più facile da debuggare. In modalità utente, i
processi non hanno accesso diretto all'hardware e sono isolati l'uno dall'altro, il che rende l'individuazione di bug e
il controllo del flusso di esecuzione più semplici e sicuri. Inoltre, in caso di crash, il sistema operativo può gestire
meglio l'errore, prevenendo effetti collaterali che potrebbero compromettere l'intero sistema.

## Istruzioni privilegiate

Il bit **Kernel/User mode** è un flag nel registro di stato del processore. In alcune architetture, è possibile che
vengano supportati più di due livelli di privilegio nel registro di stato del processore, consentendo una gestione più
granulare dei privilegi di esecuzione.

Le istruzioni disponibili solo in **modalità Kernel** sono chiamate **istruzioni privilegiate**. Queste istruzioni
permettono al sistema operativo di eseguire operazioni riservate, come l'accesso diretto all'hardware o la gestione
della memoria.

Uno dei primi passaggi in una routine del kernel è verificare se l'utente ha l'autorizzazione per eseguire
l'applicazione. Questo controllo di sicurezza assicura che solo i processi con i giusti privilegi possano accedere a
risorse sensibili, prevenendo comportamenti dannosi o non autorizzati.

## Protezione della memoria

Per rendere sicura la condivisione della memoria tra i processi, il sistema operativo deve essere in grado di
configurare l'hardware in modo che ogni processo possa leggere e scrivere solo la propria memoria.

### Protezione della Memoria con Registri Base e Bound

I primi computer usavano un semplice meccanismo per garantire la protezione dei dati: il processore disponeva di due
registri extra chiamati **base** e **bound**. Il registro **base** specifica l'inizio della regione di memoria del
processo nella memoria fisica, mentre il registro **bound** fornisce il suo endpoint, definendo i limiti della memoria a
cui il processo ha accesso. Questi registri possono essere modificati solo da **istruzioni privilegiate**.

Ogni volta che il processore recupera un'istruzione, controlla l'indirizzo del contatore di programma per verificare se
si trova tra i registri **base** e **bound**. In tal caso, il recupero dell'istruzione può procedere; in caso contrario,
l'hardware solleva un'**eccezione**, sospendendo il programma e trasferendo il controllo al **kernel** del sistema
operativo.

Allo stesso modo, per le istruzioni che leggono o scrivono dati nella memoria, il processore controlla ogni riferimento
di memoria rispetto ai registri **base** e **bound**, generando un'**eccezione** del processore se i limiti vengono
violati.

Le istruzioni complesse, come quelle di copia a blocchi, devono controllare ogni posizione toccata, per evitare che
l'applicazione legga o scriva in un buffer che inizia nella sua regione di memoria ma che si estende nella regione del
**kernel**.

Il **kernel** del sistema operativo viene eseguito senza i registri **base** e **bound**, consentendogli di accedere a
qualsiasi memoria sul sistema. Poiché le applicazioni toccano solo la propria memoria, il **kernel** deve copiare
esplicitamente qualsiasi input o output tra la memoria dell'applicazione e il resto del sistema.

L'allocazione della memoria con registri **base** e **bound** è semplice e simile a quella dell'**heap**. Quando un
programma si avvia, il **kernel** trova un blocco libero di memoria fisica contigua e lo assegna al processo. Se il
blocco è più grande del necessario, il **kernel** restituisce l'area non utilizzata per l'allocazione a un altro
processo.

Tuttavia, l'uso di registri **base** e **bound** presenta alcune limitazioni:

-   **Heap e stack espandibili**: La memoria allocata a un programma è fissa all'avvio. Tuttavia, molti programmi
    richiedono **heap** e **stack** che si espandono dinamicamente. La gestione di questa espansione è difficile con un
    singolo registro **base** e **bound**.
-   **Condivisione della memoria**: I registri **base** e **bound** non consentono la condivisione della memoria tra
    processi.
-   **Indirizzi di memoria fisica**: I programmi vengono compilati con indirizzi relativi all'inizio del file eseguibile
    (tipicamente zero). Con il sistema di registri **base** e **bound**, ogni programma viene caricato nella memoria
    fisica e deve utilizzare indirizzi fisici, che possono variare a seconda della posizione in memoria. Ciò richiede
    che il **kernel** modifichi gli indirizzi ogni volta che il programma viene caricato.

-   **Frammentazione della memoria**: La memoria può diventare frammentata quando i programmi vengono avviati e
    terminano in momenti diversi. Questo rende difficile riposizionare i programmi in memoria, e la frammentazione può
    portare a spazi liberi insufficienti per l'avvio di nuovi processi.

### Indirizzi Virtuali e la Gestione della Memoria

Per risolvere queste problematiche, i processori moderni introducono l'uso di **indirizzi virtuali**, che consentono al
sistema operativo di gestire la memoria in modo più flessibile. Ogni processo pensa di avere l'intera memoria per sé,
anche se in realtà condividono la memoria fisica. Gli **indirizzi virtuali** sono tradotti in indirizzi fisici tramite
un meccanismo di traduzione.

Un algoritmo semplice consiste nell'aggiungere il registro **base** a ogni indirizzo virtuale per ottenere l'indirizzo
fisico. Tuttavia, i sistemi moderni utilizzano algoritmi più complessi per questa traduzione.

Gli **indirizzi virtuali** consentono anche una gestione più flessibile dell'**heap** e dello **stack**. Possono
iniziare in estremità separate dello spazio di indirizzamento virtuale e crescere dinamicamente in base alle necessità
del programma. Se **heap** o **stack** crescono oltre la loro regione inizialmente allocata, il **kernel** può spostarli
in una regione più grande, ma il programma continua a utilizzare lo stesso indirizzo virtuale. Questo processo è
completamente trasparente per il programma.

---

```c
int staticVar = 0; // una variabile statica

main() {

staticVar += 1;
// sleep fa sì che il programma attenda x secondi
sleep(10);
printf("Indirizzo: %x; Valore: %d\n", &staticVar, staticVar); // Produce: "Indirizzo: 5328; Valore: 1"

}
```

Quando il programma viene eseguito più volte simultaneamente, ogni istanza del programma stamperà esattamente lo stesso
risultato. Questo accade perché, grazie agli **indirizzi virtuali**, ogni copia del programma "pensa" di avere la sua
memoria separata. Ogni processo vede solo le modifiche alla propria memoria e non può accedere o modificare la memoria
di un altro processo.

In questo modo, i **processi** sono isolati l'uno dall'altro, e un processo non può alterare la memoria di un altro
processo. Solo il **Kernel** ha il permesso di leggere o scrivere la memoria di un processo diverso da sé stesso.

## Timer interrupts

Per garantire l'isolamento dei processi, il kernel del sistema operativo deve poter riprendere periodicamente il
controllo del processore. Anche se un programma utente sembra avere il controllo completo della memoria, il sistema
operativo deve poter intervenire, ad esempio, per fermare un'applicazione in un loop infinito o per gestire attività
concorrenti.

Questo è possibile grazie a un **timer hardware** che interrompe periodicamente il processore, consentendo al sistema
operativo di prendere il controllo. Ogni interruzione, trasferisce il controllo al kernel. Gli interrupt non implicano
errori nel programma, ma permettono al sistema di gestire in modo efficace l'esecuzione dei processi.

# Tipi di trasferimento di modalità
