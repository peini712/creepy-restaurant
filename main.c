#include "gba.h"
#include "mode4.h"
#include "print.h"
#include "output.h"
#include "welcome.h"
#include "sound.h"

// func prototypes
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

// enums
#define NUMCOLORS 13
enum {START, GAME, PAUSE, WIN, LOSE};
enum {BLACKID=(256-NUMCOLORS), GREYID, MAROONID, DEEPREDID, GOLDID, BROWNID, SALMONID, PINKID, WHITEID, ROGUEID, YELLOWID, GREENID, SKYBLUEID};
enum {healthed, hurted, supered,ruined, alive, hum, bomb, pos_left, pos_right, pos_moving, mov_right, mov_left };
//init
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

// settings
#define border 50
#define space 80
#define player_area_height 20
#define line_width 2

#define player_margin 2
#define rate_bomb 25
#define tick_per_generate 10
#define speed_player 3
#define speed_bomb 2

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
    for (i=0; i<n-1; ++i)  //comparing n-1 rounds
    {
        for (j=0; j<n-1-i; ++j)  //comparing n-1-i times per round
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
    unsigned short colors[NUMCOLORS] = {BLACK, GREY, MAROON, DEEPRED, GOLD, BROWN, SALMON, PINK, WHITE, ROGUE, YELLOW, GREEN, SKYBLUE};
    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }
}

void updateGame(){
    if (BUTTON_PRESSED(BUTTON_LEFT) && player.pos == pos_right) {
        player.pos = mov_left;
    }
    if (BUTTON_PRESSED(BUTTON_RIGHT) && player.pos == pos_left) {
        player.pos = mov_right;
    }
    if (BUTTON_PRESSED(BUTTON_RSHOULDER) && super_time < 0 && player.status != supered) {
        player.status = supered;
        super_time = 60;
    }
    if(player.pos == mov_left){
        player.x -= speed_player;
        if(player.x <= space){
            player.pos = pos_left;
        }
    }
    if (player.pos == mov_right){
        player.x += speed_player;
        if(player.x >= SCREENWIDTH - 10 - space){
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

        // 30 secs
        super_time = 1800; 
    }
    if(generate_time <= 0){
        generate_time = tick_per_generate;

        for(int i=0;i<40;i++){
            if(foods[i].status != ruined){
                continue;
            }
            foods[i].pos = pos_left;
            foods[i].x = space;
            foods[i].y = SCREENHEIGHT;

            if(rand()%100 <= rate_bomb){
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
            foods[i].x = SCREENWIDTH - space - 10;
            foods[i].y = SCREENHEIGHT;

            if(rand()%100 <= rate_bomb){
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
            foods[i].y -= speed_bomb;
            if(foods[i].y <= player_area_height - foods[i].height){
                foods[i].status = ruined;
            }

            if(foods[i].y < player_area_height && foods[i].pos == player.pos){
                foods[i].status = ruined;
                if(foods[i].type == hum){
                    score += 1;
                    REG_SND2CNT = DMG_ENV_VOL(5) | DMG_STEP_TIME(2);
                    REG_SND2FREQ = NOTE_G6 | SND_RESET;
                }
                else if(player.status != supered){
                    health -= 1;
                    REG_SND2CNT = DMG_ENV_VOL(5) | DMG_STEP_TIME(7);
                    REG_SND2FREQ = NOTE_FS3 | SND_RESET;
                    REG_SND1SWEEP = DMG_SWEEP_UP | DMG_SWEEP_NUM(3) | DMG_SWEEP_STEPTIME(3);
                    REG_SND1CNT = DMG_ENV_VOL(15) | DMG_STEP_TIME(3);
                    REG_SND1FREQ = NOTE_G6 | SND_RESET;


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

    myDrawRect4(gameSettings.left, 0, gameSettings.right - gameSettings.left, player_area_height, WHITEID);
    
    if(player.status == healthed)
        drawImage4(player.x, player.y, player.width, player.height, playerBitmap);
    else if(player.status == hurted)
        drawImage4(player.x, player.y, player.width, player.height, playerHurtBitmap);
    else
        drawImage4(player.x, player.y, player.width, player.height, playerSuperBitmap);

    
    myDrawRect4(gameSettings.left, 0, line_width, SCREENHEIGHT, BROWNID);
    myDrawRect4(gameSettings.right, 0, line_width, SCREENHEIGHT, BROWNID);
    myDrawRect4(gameSettings.left, player_area_height, gameSettings.right - gameSettings.left, line_width, BROWNID);

    sprintf(buffer, "score:%d", score);
    drawString4(0, 1, buffer, GOLDID);

    sprintf(buffer, "lives:%d", health);
    drawString4(gameSettings.right + line_width, 1, buffer, GOLDID);
}
void initGame(){

    gameSettings.left = border;
    gameSettings.right = SCREENWIDTH - border - line_width;
    score = 0;
    health = 3;
    generate_time = 0;
    super_time =  0;

    player.x = space;
    player.y = player_margin;
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
        buttons = REG_BUTTONS;

         // state machine
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

// sets up GBA
void initialize()
{
    REG_DISPCTL = MODE(4) | BG2_ENABLE | DISP_BACKBUFFER;

    REG_SOUNDCNT_X = SND_ENABLED;
    REG_SOUNDCNT_L = DMG_VOL_LEFT(5) |
                   DMG_VOL_RIGHT(5) |
                   DMG_SND1_LEFT |
                   DMG_SND1_RIGHT |
                   DMG_SND2_LEFT |
                   DMG_SND2_RIGHT |
                   DMG_SND3_LEFT |
                   DMG_SND3_RIGHT |
                   DMG_SND4_LEFT |
                   DMG_SND4_RIGHT;
    REG_SOUNDCNT_H = DMG_MASTER_VOL(2);


    buttons = REG_BUTTONS;
    oldButtons = 0;
    score = 0;
    goToStart();
}

//setUpStartPage
void goToStart() {
    DMANow(3,welcomePal, PALETTE, 256);
    PALETTE[255] = WHITE;
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
    // locking frame rate to 60fps
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(rSeed); 
        goToGame();
        initGame();
    }
}

// sets up the game state
void goToGame() {
    DMANow(3,plate, PALETTE, 256); 
    set_plate();
    state = GAME;
}

// Runs every frame of the game state
void game() {
    updateGame();
    drawGame();
    waitForVBlank();
    flipPage();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    // win and lose conditions
    if (health <= 0) {
        goToLose();
    }
    if (score == 30) {
        goToWin();
    }
}

// Sets up the pause state
void goToPause() {
    fillScreen4(SKYBLUEID);
    drawString4(75, 75, "game now pausing", YELLOWID); 
    waitForVBlank();
    flipPage();
    state = PAUSE;
}

// runs pause state
void pause() {
    fillScreen4(SKYBLUEID);
    drawString4(75, 75, "game now pausing", YELLOWID); 
    waitForVBlank();
    flipPage();

    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

// Setsup win state
void goToWin() {
    fillScreen4(GREENID);
    drawString4(90, 75, "YOU WIN!", BLACKID);
    waitForVBlank();
    flipPage();
    state = WIN;
}

// Runs frame of the win state
void win() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

// Sets up the lose state
void goToLose() {
    fillScreen4(ROGUEID);
    drawString4(90, 75, "YOU LOST!", YELLOWID);
    waitForVBlank();
    waitForVBlank();
    flipPage();
    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}