void algorithm(signal_t s) {
	int i;
 									enum {
		signal1 = 1,
		signal2 = 2
	};
	enum {
		signal3 = 4,
		signal4 = 34
	};
	enum {
		signal5 = 3
	};
	int array[] = {signal1, signal2};
	int i = 0;
	int b = 3;
	int s = b;
	int t = signalTable[signal1];
	for (i=0; i<2;i++){
			signalTable[array[i]] = signalTable[signal1];
	signalTable[array[i]] = 10;
	signalTable[array[i]] = b;
	}
	if(signalTable[signal1] >= 10 && signalTable[signal1] != b) {
		signalTable[signal2] = 10;
	}
	switch(signal1) {
	case 1: 
	signalTable[signal1] = 10;
	break; 
	case signalTable[signal3]: 
	signalTable[signal1] = 12;
	break; 
	case b: 
	signalTable[signal2] = signalTable[signal3];
	break; 
	case default: 
	signalTable[signal4] = 10;
	break;
	}
	if((signalTable[signal1] == 10 || signalTable[signal2] == 11) && (signalTable[signal3] == 1 || signalTable[signal2] == 11)) {
		signalTable[signal4] = 10;
	}
	else {
		for (i=0; i<2;i++){
	if(signalTable[array[i]] == 10) {
		signalTable[array[i]] = 2;
	}
	}
	}
} 
