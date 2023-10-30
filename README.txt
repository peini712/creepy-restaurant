CS2261-HW4 March2, 2023
////Welcome to Creepy Restaurant////

Simply put, the path to win this game is to eat good stuff.

Player Input: A(Left) D(Right) O(SuperState) ENTER(Switch States:start/pause)
Game Rules: You are the player on top of the screen, you can only switch
            betw left/right positions. To gain scores, eat burger. 
            If you eat the bomb, one life would be deducted. In total
            you will have 3 lives at the beginning of the game. You can enter 
            into SuperState during which you won't get hurt by bombs, 
            but you can only use this for once in each round. When you eat
            30 burgers, you'll win! You can pause at any time.
Display Instruction: The player has 3 types of figures: 
                     Normal(Default figure), Hurt(Black and White), Super(WOW^-^)
                     Once player get hurt/enter super mode, the image would change
                     based on the related input.
Advanced Instructions: Your history scores will appear at the welcome screen once
                        you have finished your first round. 