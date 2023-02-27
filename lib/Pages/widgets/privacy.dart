import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 60),
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              Card(
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Informazioni Legali",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    const Text(
                      " Questa pagina è usata per informare i visitatori riguardo le mie politiche con il collezionamento, uso, e utilizzo di Informazioni Personali se qualcuno decide di usare il nostro Servizio.\n Se scegliete di usare il nostro servizio, allora acconsentite al collezionamento e all'uso delle informazioni in relazione a questa policy. Le Informazioni Personali che collezioniamo sono usate per provvedere e migliorare il Servizio. Non useremo o condivideremo le vostre informazioni con nessuno eccetto quanto descritto nella Privacy Policy.\n I termini usati in questa Privacy Policy hanno lo stesso significato dei nostri Termini e Condizioni, che sono disponibili in Go2Beach salvo diversamente definito in questo Privacy Policy.",
                      style: TextStyle(fontSize: 15),
                    ),
                    Row(
                      children: const [
                        Text(
                          "Collezionamento di Informazioni e Uso",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    const Text(
                      "Per una miglior esperienza, mentre usate il nostro Servizio, potremmo richidervi di fornirci alcune informazioni di identificazione personale, incluse ma non limitate a Nome, Cognome, Numero di telefono, email, Data di Nascita. Le informazioni che richiediamo saranno tenute nel vostro dispositivo e non saranno collezionate da noi in alcuna maniera.",
                      style: TextStyle(fontSize: 15),
                    ),
                    Row(
                      children: const [
                        Text(
                          "Log Data",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    const Text(
                      "Vi informiamo che qualora usaste il nostro Servizio, in caso di un errore in app collezioniamo dati e informazioni (attraverso prodotti di terze parti) sul tuo telefono chiamato Log Data. Questo Log Data potrebbe includere informazioni come l'indirizzo del Protocollo Internet del dispositivo (“IP”) , Nome del Dispositivo, Versione del Sistema Operativo, il tempo e la data del vostro uso del Servizio, e altre statistiche.",
                      style: TextStyle(fontSize: 15),
                    ),
                    Row(
                      children: const [
                        Text(
                          "Cookies",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    const Text(
                      " Cookies sono file con piccole quantità di dati usati come identificatori univoci anonimi. Vengono mandati al tuo browser dai siti web che visiti e sono salvati nella memoria interna del tuo dispositivo. \n Questo Servizio non usa questi “cookies” esplicitamente. Tuttavia , l'app potrebbe usare codice e librerie di terze parti che usano “cookies” per collezionare informazioni e migliorare i loro servizi. Avete la possibilità di accettare o rifiutare questi cookies e sapere quando un cookie viene mandato al dispositivo. Se scegliete di rifiutare i nostri cookie, potreste non essere in grado di usare alcune porzioni del nostro Servizio.",
                      style: TextStyle(fontSize: 15),
                    ),
                    Row(
                      children: const [
                        Text(
                          "Fornitori del Servizio",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    const Text(
                      " Potrei utilizzare compagnie o individui di terze parti per i seguenti motivi:\n -Per facilitare il nostro servizio;\n -Per provvedere al Servizio al posto nostro;\n -Per effettuare operazioni relative al Servizio; o\n -Per assisterci ad analizzare come viene usato il nostro Servizio.\n -Vogliamo informare gli utenti di questo Servizio che queste terze parti hanno accesso alle loro Informazioni Personali. Il motivo è per effettuare i compiti loro assegnati al posto nostro. Tuttavia, sono obbligati a non diffondere o usare le informazioni per ogni altro scopo.",
                      style: TextStyle(fontSize: 15),
                    ),
                    Row(
                      children: const [
                        Text(
                          "Sicurezza",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    const Text(
                      " Significa molto la vostra fiducia nel fornirci Informazioni Personali, per questo le useremo solo per scopi commercialmente accettabili, proteggendole. Ma ricordate che nessun metodo di trasmissione tramite internet, o metodi di conservazione elettronici sono sicuri e affidabili al 100%, e non possiamo garantire la sicurezza assoluta.",
                      style: TextStyle(fontSize: 15),
                    ),
                    Row(
                      children: const [
                        Text(
                          "Links ad Altri Siti",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    const Text(
                      " Questo Servizio potrebbe contenere links ad altri siti. Se cliccate su un link di terze parti, sarete reindirizzati direttamente su quel sito. Da nota che questi siti non sono controllati da noi.",
                      style: TextStyle(fontSize: 15),
                    ),
                    Row(
                      children: const [
                        Text(
                          "Cambiamenti a questa Privacy Policy",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    const Text(
                      " Potremmo aggiornare la nostra Privacy Policy da un momento all'altro. Per questo, consigliamo di rivedere questa pagina periodicamente in caso di cambiamenti.\n Questa policy ha effetto immediato dal 27/02/2023",
                      style: TextStyle(fontSize: 15),
                    ),
                    Row(
                      children: const [
                        Text(
                          "Contattaci",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    const Text(
                      " Se avete domande o suggerimenti sulla nostra Privacy Policy, non esitate a contattarci a go2beach00@gmail.com.",
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 131, 198, 230),
    );
  }
}
