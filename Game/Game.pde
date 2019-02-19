
// Example 16-6: Drawing a grid of squares

// Size of each cell in the grid, ratio of window size to video size
// 80 * 8 = 640
// 60 * 8 = 480
import java.util.*;
int videoScale = 8;
Scanner sc = new Scanner(System.in);
// Number of columns and rows in our system
int cols, rows,inputX,inputY;
boolean[][] cell;

void setup() {
  size(640, 480);

  // Initialize columns and rows
  cols = width/videoScale;
  rows = height/videoScale;
  cell = new boolean[cols][rows];
grid();
cellAlive(5,5);
cellAlive(5,6);
cellAlive(6,5);
cellAlive(6,6);

cellAlive(7,7);
cellAlive(7,8);
cellAlive(7,9);
  
}

void draw() {
  
 grid();
 translateGrid();
 gridLive();
 



  
}

void grid(){
  
  // Begin loop for columns
  for (int i = 0; i < cols; i++) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++) {

      // Scaling up to draw a rectangle at (x,y)
      int x = i*videoScale;
      int y = j*videoScale;
      fill(255);
      stroke(0);
      // For every column and row, a rectangle is drawn at an (x,y) location scaled and sized by videoScale.
      rect(x, y, videoScale, videoScale);
    }
  }
}

void translateGrid(){
   for(int i = 0; i < cols; i++){
    for(int j = 0; j<rows; j++){
      
      if(cell[i][j] == true){
        cellAlive(i,j);
      }else
      cellDead(i,j);
      
    }
  }
}
void  cellAlive(int x, int y ){
 fill(0);
 stroke(100);
 rect( x*videoScale,y*videoScale,videoScale,videoScale);
 
}
void  cellDead(int x, int y ){
 fill(255);
 stroke(100);
 rect( x*videoScale,y*videoScale,videoScale,videoScale);
}

void gridLive(){
  
  for(int i = 0; i < cols; i++){
    for(int j = 0; j<rows; j++){
      if(cell[i][j] == true){
        if(countAlive(i,j) <2 || countAlive(i,j)>3){
         cell[i][j] = false;
        }else
        cell[i][j] = true;
      }
      if(cell[i][j] == false){
        if(countAlive(i,j) ==  3){
          cell[i][j] = true;
      }
      
    }
  }
}
}

int countAlive(int x, int y){
  int count = 0;
  
  
  if(cell[x-1][y] == true){
    count++;
  }
    if(cell[x+1][y] == true){
    count++;
  }
    if(cell[x][y-1] == true){
    count++;
  }
    if(cell[x][y+1] == true){
    count++;
  }
    if(cell[x+1][y+1] == true){
    count++;
  }
    if(cell[x+1][y-1] == true){
    count++;
  }
    if(cell[x-1][y+1] == true){
    count++;
  }
    if(cell[x-1][y-1] == true){
    count++;
  }
  
  return count;
}

void drawCell(int x, int y ){
  cell[x][y] = true;
}
