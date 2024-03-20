 
##### todo:
- capire se il pic è stato attivato, quindi quello che devo provare a fare è scrivere le interrupt routines con una struttura simile all articolo in osdev per timer e tastiera, gestire sia il passaggio dell'interrupt number che la notifica di EOI (sto dando per scontato che vi siano collegati tastiera all IRQ1).
-s crivere un driver per la tastiera
- attivare la paginazione



##### appunti sul PIT
questo controllore ha 4 porte, 3 di dati 1 per i comandi, quelle perr i dati sono divisi per canale.
quella di comando ha questo significato:
