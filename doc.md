 
##### todo:

- implementare la gestione dei frame di memoria, reference : 
  - OSDev memory allocation: https://wiki.osdev.org/Memory_Allocation
  - OSDev page frame allocation: https://wiki.osdev.org/Page_Frame_Allocation 
  - Qua spiega come accedere alle tabelle delle pagine attraverso il paging ricorsivo: https://wiki.osdev.org/User:Neon/Recursive_Paging

-  scrivere un driver per la tastiera 
- implementare lo shadow paging

##### risorse

- https://web.eecs.umich.edu/~ryanph/jhu/cs318/fall19/lectures/lec18_vmm.pdf spiega lo shadow paging bene
- https://www.qemu.org/docs/master/system/monitor.html documentazione su qemu monitor
- https://cs.nyu.edu/~mwalfish/classes/ut/s10-cs372h/ref/qemu-gdb-reference.html#:~:text=While%20GDB%20can%20only%20access,while%20setting%20up%20virtual%20memory. documentazione su qemu



##### Implementazione dello shadow paging 

Inizialmente ci troviamo all'interno del codice guest, il guest pensa di avere il controllo sulla memoria fisica
e carica l'indirizzo della ptd all'interno del registro cr3, quindi: 'mov guest_page_directory, %cr3' deve trappare
all'interno dell'hypervisor.

l'hypervisor deve segnarsi l'indirizzo di questa pagina per poterla marchiare come pagina write protected, questo per far
si che quando il guest scrive su questa tabella, venga generata un eccezione che trappi l'hypervisor, a quel punto l'hypervisor modificherà il contenuto di quella tabella facendo credere al guest di aver completato la write, e modificherà la shadow page table associata al guest di conseguenza. 

