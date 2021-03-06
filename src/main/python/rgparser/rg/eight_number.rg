r = roundrect(175, 75, 450, 450, 10, 10);
line1 = line(325, 75, 325, 525);
line2 = line(175, 225, 625, 225);
line3 = line(475, 75, 475, 525);
line4 = line(175, 375, 625, 375);

board = [r, line1, line2, line3, line4];

l = [2, 1, 0, 3, 4, 2, 5, 8, 6, 7];

def move(dir) {
	if (dir == 1 and l[0] % 3 == 0) {
		return;
	}
	
	if (dir == -1 and l[0] % 3 == 1) {
		return;
	}
		
	if (l[0] + dir < 1 or l[0] + dir > 9) {
		return;
	}
		
	l[l[0]] = l[l[0] + dir];
	l[0] = l[0] + dir;
	l[l[0]] = 0;
}

setKeyMap({
	"VK_LEFT" : (lambda : move(1)),
	"VK_RIGHT" : (lambda : move(-1)),
	"VK_UP" : (lambda : move(3)),
	"VK_DOWN" : (lambda : move(-3)),
});

def isWin() {
    i = 0;
    while (i< 8) {
        i += 1;
        if (l[i] != i) {
            return False;
		}
	}
	
	return l[9] == 0;
}

def update() {
	i = 1;
	
	if (not isWin()) {
        while (i <= 9) {
            if (l[i] == 0) {
                i += 1;
                continue;
			}
                        
            x = 250 + (i + 2) % 3 * 150 - 12;
            y = 150 + (i - 1) / 3 * 150 + 12;
            t = rgtext(l[i], x, y, "Arial Black", 24);
                        
            draw t;
            i += 1;
		}
        draw board;
	}
    else {
        t = rgtext("You Win", 312, 262, "Arial Black", 24);
        draw t;
	}
}

setUpdate(update);
