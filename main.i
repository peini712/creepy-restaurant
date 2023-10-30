# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;






extern volatile unsigned short *videoBuffer;
# 37 "gba.h"
void waitForVBlank();
# 63 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 79 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 111 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 2 "main.c" 2
# 1 "mode4.h" 1
# 10 "mode4.h"
void flipPage();
void setPixel4(int x, int y, unsigned char colorIndex);
void drawRect4(int x, int y, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int x, int y, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);
void drawChar4(int x, int y, char ch, unsigned short colorIndex);
void drawString4(int x, int y, char *str, unsigned short colorIndex);
void myDrawRect4(int x, int y, int width, int height, volatile unsigned char colorIndex);
# 3 "main.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 4 "main.c" 2
# 1 "output.h" 1



extern const unsigned short bombBitmap[70];

extern const unsigned short hamburgerBitmap[36];

extern const unsigned short playerBitmap[80];

extern const unsigned short playerHurtBitmap[80];

extern const unsigned short playerSuperBitmap[80];
extern const unsigned short plate[256];
# 5 "main.c" 2
# 1 "welcome.h" 1
# 21 "welcome.h"
extern const unsigned short welcomeBitmap[19200];


extern const unsigned short welcomePal[256];
# 6 "main.c" 2
# 1 "sound.h" 1
# 75 "sound.h"
enum {
  REST = 0,
  NOTE_C2 =44,
  NOTE_CS2 =157,
  NOTE_D2 =263,
  NOTE_DS2 =363,
  NOTE_E2 =457,
  NOTE_F2 =547,
  NOTE_FS2 =631,
  NOTE_G2 =711,
  NOTE_GS2 =786,
  NOTE_A2 =856,
  NOTE_AS2 =923,
  NOTE_B2 =986,
  NOTE_C3 =1046,
  NOTE_CS3 =1102,
  NOTE_D3 =1155,
  NOTE_DS3 =1205,
  NOTE_E3 =1253,
  NOTE_F3 =1297,
  NOTE_FS3 =1339,
  NOTE_G3 =1379,
  NOTE_GS3 =1417,
  NOTE_A3 =1452,
  NOTE_AS3 =1486,
  NOTE_B3 =1517,
  NOTE_C4 =1547,
  NOTE_CS4 =1575,
  NOTE_D4 =1602,
  NOTE_DS4 =1627,
  NOTE_E4 =1650,
  NOTE_F4 =1673,
  NOTE_FS4 =1694,
  NOTE_G4 =1714,
  NOTE_GS4 =1732,
  NOTE_A4 =1750,
  NOTE_AS4 =1767,
  NOTE_B4 =1783,
  NOTE_C5 =1798,
  NOTE_CS5 =1812,
  NOTE_D5 =1825,
  NOTE_DS5 =1837,
  NOTE_E5 =1849,
  NOTE_F5 =1860,
  NOTE_FS5 =1871,
  NOTE_G5 =1881,
  NOTE_GS5 =1890,
  NOTE_A5 =1899,
  NOTE_AS5 =1907,
  NOTE_B5 =1915,
  NOTE_C6 =1923,
  NOTE_CS6 =1930,
  NOTE_D6 =1936,
  NOTE_DS6 =1943,
  NOTE_E6 =1949,
  NOTE_F6 =1954,
  NOTE_FS6 =1959,
  NOTE_G6 =1964,
  NOTE_GS6 =1969,
  NOTE_A6 =1974,
  NOTE_AS6 =1978,
  NOTE_B6 =1982,
  NOTE_C7 =1985,
  NOTE_CS7 =1989,
  NOTE_D7 =1992,
  NOTE_DS7 =1995,
  NOTE_E7 =1998,
  NOTE_F7 =2001,
  NOTE_FS7 =2004,
  NOTE_G7 =2006,
  NOTE_GS7 =2009,
  NOTE_A7 =2011,
  NOTE_AS7 =2013,
  NOTE_B7 =2015,
  NOTE_C8 =2017
} NOTES;
# 7 "main.c" 2


void initialize();
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();
void initGame();



enum {START, GAME, PAUSE, WIN, LOSE};
enum {BLACKID=(256-13), GREYID, MAROONID, DEEPREDID, GOLDID, BROWNID, SALMONID, PINKID, WHITEID, ROGUEID, YELLOWID, GREENID, SKYBLUEID};
enum {healthed, hurted, supered,ruined, alive, hum, bomb, pos_left, pos_right, pos_moving, mov_right, mov_left };

unsigned short oldButtons;
unsigned short buttons;
int score;
int health;
int generate_time;
int super_time;
int state;
int rSeed;
char buffer[40];
int his_scores[4]= {0,0,0,0};
# 51 "main.c"
struct GAME{
    int left;
    int right;
} gameSettings;

struct PLAYER{
    int width;
    int height;
    int x;
    int y;
    int status;
    int pos;
}player;

struct FOOD{
    int x;
    int y;
    int status;
    int type;
    int width;
    int height;
    int pos;
};

struct FOOD foods[40];

void sort(int a[], int n){
    int buf,i,j;
    for (i=0; i<n-1; ++i)
    {
        for (j=0; j<n-1-i; ++j)
        {
            if (a[j] < a[j+1])
            {
                buf = a[j];
                a[j] = a[j+1];
                a[j+1] = buf;
            }
        }
    }
}
void set_plate(){
    unsigned short colors[13] = {(((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10), (((5) & 31) | ((3) & 31) << 5 | ((3) & 31) << 10), (((18) & 31) | ((9) & 31) << 5 | ((9) & 31) << 10), (((23) & 31) | ((7) & 31) << 5 | ((7) & 31) << 10), (((26) & 31) | ((18) & 31) << 5 | ((1) & 31) << 10), (((10) & 31) | ((6) & 31) << 5 | ((5) & 31) << 10), (((23) & 31) | ((10) & 31) << 5 | ((10) & 31) << 10), (((27) & 31) | ((25) & 31) << 5 | ((25) & 31) << 10), (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10), (((22) & 31) | ((6) & 31) << 5 | ((13) & 31) << 10), (((31) & 31) | ((31) & 31) << 5 | ((0) & 31) << 10), (((0) & 31) | ((31) & 31) << 5 | ((0) & 31) << 10), (((17) & 31) | ((27) & 31) << 5 | ((31) & 31) << 10)};
    for (int i = 0; i < 13; i++) {
        ((unsigned short *)0x5000000)[256-13 +i] = colors[i];
    }
}

void updateGame(){
    if ((!(~(oldButtons) & ((1<<5))) && (~(buttons) & ((1<<5)))) && player.pos == pos_right) {
        player.pos = mov_left;
    }
    if ((!(~(oldButtons) & ((1<<4))) && (~(buttons) & ((1<<4)))) && player.pos == pos_left) {
        player.pos = mov_right;
    }
    if ((!(~(oldButtons) & ((1<<8))) && (~(buttons) & ((1<<8)))) && super_time < 0 && player.status != supered) {
        player.status = supered;
        super_time = 60;
    }
    if(player.pos == mov_left){
        player.x -= 3;
        if(player.x <= 80){
            player.pos = pos_left;
        }
    }
    if (player.pos == mov_right){
        player.x += 3;
        if(player.x >= 240 - 10 - 80){
            player.pos = pos_right;
        }
    }

    generate_time --;
    super_time --;

    if(super_time < 0 && player.status == supered){
        if(health == 3)
            player.status = healthed;
        else
            player.status = hurted;


        super_time = 1800;
    }
    if(generate_time <= 0){
        generate_time = 10;

        for(int i=0;i<40;i++){
            if(foods[i].status != ruined){
                continue;
            }
            foods[i].pos = pos_left;
            foods[i].x = 80;
            foods[i].y = 160;

            if(rand()%100 <= 25){
                foods[i].type = bomb;
                foods[i].width = 10;
                foods[i].height = 14;
            }
            else{
                foods[i].type = hum;
                foods[i].width = 8;
                foods[i].height = 9;
            }
            foods[i].status = alive;
            break;
        }

        for(int i=0;i<40;i++){
            if(foods[i].status != ruined){
                continue;
            }
            foods[i].pos = pos_right;
            foods[i].x = 240 - 80 - 10;
            foods[i].y = 160;

            if(rand()%100 <= 25){
                foods[i].type = bomb;
                foods[i].width = 10;
                foods[i].height = 14;
            }
            else{
                foods[i].type = hum;
                foods[i].width = 8;
                foods[i].height = 9;
            }
            foods[i].status = alive;
            break;
        }
    }

    for(int i=0;i<40;i++){
        if(foods[i].status == alive){
            foods[i].y -= 2;
            if(foods[i].y <= 20 - foods[i].height){
                foods[i].status = ruined;
            }

            if(foods[i].y < 20 && foods[i].pos == player.pos){
                foods[i].status = ruined;
                if(foods[i].type == hum){
                    score += 1;
                    *(volatile u16*)0x04000068 = (((5) & 15) << 12) | (((2) & 7) << 8);
                    *(volatile u16*)0x0400006C = NOTE_G6 | (1<<15);
                }
                else if(player.status != supered){
                    health -= 1;
                    *(volatile u16*)0x04000068 = (((5) & 15) << 12) | (((7) & 7) << 8);
                    *(volatile u16*)0x0400006C = NOTE_FS3 | (1<<15);
                    *(volatile u16*)0x04000060 = (0 << 3) | ((3) & 7) | (((3) & 7) << 4);
                    *(volatile u16*)0x04000062 = (((15) & 15) << 12) | (((3) & 7) << 8);
                    *(volatile u16*)0x04000064 = NOTE_G6 | (1<<15);


                    player.status = hurted;
                }
            }
        }
    }


}
void drawGame(){

    fillScreen4(WHITEID);
    for(int i=0;i<40;i++){
        if(foods[i].status != ruined){
            if(foods[i].type == bomb){
                drawImage4(foods[i].x, foods[i].y, foods[i].width, foods[i].height, bombBitmap);
            }
            else{
                drawImage4(foods[i].x, foods[i].y, foods[i].width, foods[i].height, hamburgerBitmap);
            }
        }
    }

    myDrawRect4(gameSettings.left, 0, gameSettings.right - gameSettings.left, 20, WHITEID);

    if(player.status == healthed)
        drawImage4(player.x, player.y, player.width, player.height, playerBitmap);
    else if(player.status == hurted)
        drawImage4(player.x, player.y, player.width, player.height, playerHurtBitmap);
    else
        drawImage4(player.x, player.y, player.width, player.height, playerSuperBitmap);


    myDrawRect4(gameSettings.left, 0, 2, 160, BROWNID);
    myDrawRect4(gameSettings.right, 0, 2, 160, BROWNID);
    myDrawRect4(gameSettings.left, 20, gameSettings.right - gameSettings.left, 2, BROWNID);

    sprintf(buffer, "score:%d", score);
    drawString4(0, 1, buffer, GOLDID);

    sprintf(buffer, "lives:%d", health);
    drawString4(gameSettings.right + 2, 1, buffer, GOLDID);
}
void initGame(){

    gameSettings.left = 50;
    gameSettings.right = 240 - 50 - 2;
    score = 0;
    health = 3;
    generate_time = 0;
    super_time = 0;

    player.x = 80;
    player.y = 2;
    player.width = 10;
    player.height = 16;
    player.status = healthed;
    player.pos = pos_left;

    for(int i=0;i<40;i++){
        foods[i].status = ruined;
    }

}
int main() {
    initialize();
    while (1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        switch (state) {
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }

    }
}


void initialize()
{
    (*(volatile unsigned short *)0x4000000) = ((4) & 7) | ((1 << (8 + (2 % 4)))) | (1 << 4);

    *(volatile u16*)0x04000084 = (1<<7);
    *(volatile u16*)0x04000080 = (((5) & 7) << 0) |
                   (((5) & 7) << 4) |
                   (1 << 8) |
                   (1 << 12) |
                   (1 << 9) |
                   (1 << 13) |
                   (1 << 10) |
                   (1 << 14) |
                   (1 << 11) |
                   (1 << 15);
    *(volatile u16*)0x04000082 = ((2) % 3);


    buttons = (*(volatile unsigned short *)0x04000130);
    oldButtons = 0;
    score = 0;
    goToStart();
}


void goToStart() {
    DMANow(3,welcomePal, ((unsigned short *)0x5000000), 256);
    ((unsigned short *)0x5000000)[255] = (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10);
    drawFullscreenImage4(welcomeBitmap);
    his_scores[3] = score;
    sort(his_scores, 4);
    if(his_scores[0] > 0){
        for(int i=0;i<3;i++){
            if(his_scores[i] > 0){
                sprintf(buffer, "RANK %d : %d", i+1, his_scores[i]);
                drawString4(75, 85 + 10*i, buffer, 255);
            }
        }
    }
    waitForVBlank();
    flipPage();
    state = START;

}

void start() {
    rSeed++;

    waitForVBlank();
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        srand(rSeed);
        goToGame();
        initGame();
    }
}


void goToGame() {
    DMANow(3,plate, ((unsigned short *)0x5000000), 256);
    set_plate();
    state = GAME;
}


void game() {
    updateGame();
    drawGame();
    waitForVBlank();
    flipPage();
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToPause();
    }

    if (health <= 0) {
        goToLose();
    }
    if (score == 30) {
        goToWin();
    }
}


void goToPause() {
    fillScreen4(SKYBLUEID);
    drawString4(75, 75, "game now pausing", YELLOWID);
    waitForVBlank();
    flipPage();
    state = PAUSE;
}


void pause() {
    fillScreen4(SKYBLUEID);
    drawString4(75, 75, "game now pausing", YELLOWID);
    waitForVBlank();
    flipPage();

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3)))))
        goToGame();
    else if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2)))))
        goToStart();
}


void goToWin() {
    fillScreen4(GREENID);
    drawString4(90, 75, "YOU WIN!", BLACKID);
    waitForVBlank();
    flipPage();
    state = WIN;
}


void win() {
    waitForVBlank();
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToStart();
    }
}


void goToLose() {
    fillScreen4(ROGUEID);
    drawString4(90, 75, "YOU LOST!", YELLOWID);
    waitForVBlank();
    waitForVBlank();
    flipPage();
    state = LOSE;
}


void lose() {
    waitForVBlank();
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToStart();
    }
}
