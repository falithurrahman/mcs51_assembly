start:
	clr p0.0
   	jnb p1.0,nyala1
   	jmp start
nyala1:
   	clr p0.0
	jnb p1.1,mati
   	jmp nyala1
mati:
   	setb p0.0
   	jb p1.1,matilagi
   	jmp mati
matilagi:
   	setb p0.0
   	jb p1.0,start
   	jmp matilagi


   