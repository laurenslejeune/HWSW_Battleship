#include <stdio.h>

#define DIMENSION 10

//Boolean definitions
#define FALSE -1
#define TRUE 0

//Orientations definitions
#define HORIZONTAL 0
#define VERTICAL 1

//Movement definitions
#define UP 0
#define DOWN 1
#define LEFT 2
#define RIGHT 3

/*
Coordinate system:

------→ x
|
|
↓
y

*/


typedef struct Tile
{
    int shipId;   // Ship ID if any, -1 otherwise
    int isHit;    // 0 if not hit, 1 if hit
} Tile;

typedef struct Ship
{
    int size;
} Ship;


Ship ships[4];

Tile game_board[DIMENSION][DIMENSION];
Tile placement_board[DIMENSION][DIMENSION];
Tile enemy_board[DIMENSION][DIMENSION];

//The placement X and Y coordinates always indicate the upper left coordinates
int placementX, placementY, placementOrientation;

void addShip(Ship ship, int id)
{
    ships[id] = ship;
    for (int i = 0; i<ship.size; i++)
    {
        Tile newTile;
        newTile.isHit = 0;
        newTile.shipId = id;
        placement_board[i][0] = newTile;
    }
    
    placementX = 0;
    placementY = 0;
    placementOrientation = 0;   //Horizontal placement
    printf("New ship %d, at (%d,%d)\n",id,placementX,placementY);
}

int canMoveShip(int movement)
{
    int x = placementX;
    int y = placementY;
    int orientation = placementOrientation;
    int size = ships[placement_board[x][y].shipId].size;
    switch (movement)
    {
        case LEFT:
            //Can move left:
            if(x == 0)
            {
                return FALSE;
            }
            break;

        case UP:
            //Can move up:
            if(y == 0)
            {
                return FALSE;
            }
            break;
        case DOWN:
            //Can move down:
            if(orientation == HORIZONTAL)
            {
                if(y == DIMENSION-1)
                {
                    return FALSE;
                }
            }
            else
            {
                if((y + size -1) == DIMENSION-1)
                {
                    return FALSE;
                }
            }
            break;
        case RIGHT:
            //Can move right:
            if(orientation == HORIZONTAL)
            {
                if((x + size -1) == DIMENSION-1)
                {
                    return FALSE;
                }
            }
            else
            {
                if(x == DIMENSION-1)
                {
                    return FALSE;
                }
            }
            break;
        default:
            return FALSE;
            break;
    }
    return TRUE;
}

void moveShipUP()
{
    int x = placementX;
    int y = placementY;
    int orientation = placementOrientation;
    int size = ships[placement_board[x][y].shipId].size;

    if(orientation == VERTICAL)
    {
        placement_board[x][y - 1].shipId = placement_board[x][y].shipId; 
        placement_board[x][y + size -1].shipId = FALSE;
        placementY--;
    }
    else
    {
        for(int i = 0; i < size; i++)
        {
            placement_board[x + i][y - 1].shipId = placement_board[x + i][y].shipId;
            placement_board[x + i][y].shipId = FALSE;
        }
        placementY--;
    }
}

void moveShipDOWN()
{
    int x = placementX;
    int y = placementY;
    int orientation = placementOrientation;
    int size = ships[placement_board[x][y].shipId].size;

    if(orientation == VERTICAL)
    {
        placement_board[x][y + size].shipId = placement_board[x][y].shipId; 
        placement_board[x][y].shipId = FALSE;
        placementY++;
    }
    else
    {
        for(int i = 0; i < size; i++)
        {
            placement_board[x + i][y + 1].shipId = placement_board[x + i][y].shipId;
            placement_board[x + i][y].shipId = FALSE;
        }
        placementY++;
    }
}

void moveShipLEFT()
{
    int x = placementX;
    int y = placementY;
    int orientation = placementOrientation;
    int size = ships[placement_board[x][y].shipId].size;

    if(orientation == HORIZONTAL)
    {
        placement_board[x-1][y].shipId = placement_board[x][y].shipId; 
        placement_board[x + size - 1][y].shipId = FALSE;
        placementX--;
    }
    else
    {
        for(int i = 0; i < size; i++)
        {
            placement_board[x - 1][y + i].shipId = placement_board[x][y + i].shipId;
            placement_board[x][y + i].shipId = FALSE;
        }
        placementX--;
    }
}

void moveShipRIGHT()
{
    int x = placementX;
    int y = placementY;
    int orientation = placementOrientation;
    int size = ships[placement_board[x][y].shipId].size;

    if(orientation == HORIZONTAL)
    {
        placement_board[x + size][y].shipId = placement_board[x][y].shipId; 
        placement_board[x][y].shipId = FALSE;
        placementX++;
    }
    else
    {
        for(int i = 0; i < size; i++)
        {
            placement_board[x + 1][y + i].shipId = placement_board[x][y + i].shipId;
            placement_board[x][y + i].shipId = FALSE;
        }
        placementX++;
    }
}

int moveShip(int movement)
{
    int x = placementX;
    int y = placementY;
    int orientation = placementOrientation;
    int size = ships[placement_board[x][y].shipId].size;

    if(canMoveShip(movement) == TRUE)
    {
        switch (movement)
        {
            case UP:
                moveShipUP();
                break;
            case DOWN:
                moveShipDOWN();
                break;
            case LEFT:
                moveShipLEFT();
                break;
            case RIGHT:
                moveShipRIGHT();
            default:
                return FALSE;
        }
        return TRUE;
    }
    return FALSE;
}

int canRotate()
{
    int x = placementX;
    int y = placementY;
    int orientation = placementOrientation;
    int size = ships[placement_board[x][y].shipId].size;


    if(orientation == HORIZONTAL)
    {
        //x + size - 1 becomes the final value for y
        if ((y + size - 1) < DIMENSION)
        {
            return TRUE;
        }
    }
    else
    {
        if ((x + size - 1) < DIMENSION)
        {
            return TRUE;
        }
    }
    return FALSE;
    
}

int rotateShip()
{
    int x = placementX;
    int y = placementY;
    int orientation = placementOrientation;
    int size = ships[placement_board[x][y].shipId].size;
    if(canRotate() == TRUE)
    {
        if(orientation == HORIZONTAL)
        {
            for(int i=1;i<size;i++)
            {
                placement_board[x][y+i].shipId = placement_board[x+i][y].shipId;
                placement_board[x+i][y].shipId = FALSE; 
            }
            placementOrientation = VERTICAL;
        }
        else
        {
            for(int i=1;i<size;i++)
            {
                placement_board[x+i][y].shipId = placement_board[x][y+i].shipId;
                placement_board[x][y+i].shipId = FALSE; 
            }
            placementOrientation = HORIZONTAL;
        }
        return TRUE;
    }
    return FALSE;
}

/*
 * Check if the ship can be fixed. This is only possible if it does not cover other ships.
 * Returns:
 * TRUE  = Placement possible
 * FALSE = Placement impossible, a fixed ship obstructs the placement
 */ 
int canBeFixed()
{
    int x = placementX;
    int y = placementY;
    int orientation = placementOrientation;
    int size = ships[placement_board[x][y].shipId].size;
    for (int i = 0; i<size; i++)
    {
        if (orientation == 0)
        {
            if (game_board[x+i][y].shipId != FALSE)
            {
                return FALSE;
            }
        }
        else
        {
            if (game_board[x][y+i].shipId != FALSE)
            {
                return FALSE;
            }
        }
    }
    return TRUE;
}

/*
 * Fix the placement of the ship. This is only possible if it does not cover other ships.
 * Returns:
 * 0  = Fixing successful
 * -1 = Fixing unsuccesful, a fixed ship obstructs the placement
 */ 
int fixPlacement()
{
    int x = placementX;
    int y = placementY;
    int orientation = placementOrientation;
    int size = ships[placement_board[x][y].shipId].size;

    if (canBeFixed() == TRUE)
    {
        for (int i = 0; i<size; i++)
        {
            if (orientation == 0)
            {
                game_board[x+i][y].shipId = placement_board[x+i][y].shipId;
                placement_board[x+i][y].shipId = FALSE;
            }
            else
            {
                game_board[x][y+i].shipId = placement_board[x][y+i].shipId;
                placement_board[x][y+i].shipId = FALSE;
            }
        }
        return TRUE;
    }
    return FALSE;
    
}


void printPlacementBoard()
{
    for(int i = 0; i<DIMENSION;i++)
    {
        for(int j = 0; j<DIMENSION; j++)
        {
            printf("%d",placement_board[j][i].shipId+1);
        }
        printf("\n");
    }
}

void printGlobalBoard()
{
    for(int i = 0; i<DIMENSION;i++)
    {
        for(int j = 0; j<DIMENSION; j++)
        {
            int placementB = placement_board[j][i].shipId;
            int gameB = game_board[j][i].shipId;
            if((placementB > -1) && (gameB > -1))
            {
                printf("%c",'x');
            }
            else if (gameB > -1)
            {
                printf("%d",gameB + 1);
            }
            else
            {
                printf("%d",placementB + 1);
            }
        }
        printf("\n");
    }
}

void initializeBoards()
{
    for(int i=0;i<DIMENSION;i++)
    {
        for(int j=0;j<DIMENSION;j++)
        {
            Tile t;
            t.isHit = FALSE;
            t.shipId = -1;
            placement_board[j][i] = t;
            game_board[j][i] = t;
        }
    }
}

void main()
{   
    initializeBoards();
    Ship ship;
    ship.size = 4;
    int currentId = 0;
    addShip(ship, currentId);
    printPlacementBoard();
    while(1)
    {
        int movement;
        scanf("%d",&movement);
        printf("\n");
        if(movement == 5)
        {
            int fixing = fixPlacement();
            if(fixing == TRUE)
            {
                currentId++;
                addShip(ship,currentId);
            }
            else
            {
                printf("Cannot place here\n");
            }
            
        }
        else if (movement==4)
        {
            rotateShip();
        }
        else
        {
            moveShip(movement);
        }
        printGlobalBoard();
    }
}