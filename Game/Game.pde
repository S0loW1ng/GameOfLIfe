
// Example 16-6: Drawing a grid of squares

// Size of each cell in the grid, ratio of window size to video size
// 80 * 8 = 640
// 60 * 8 = 480
int videoScale = 8;

// Number of columns and rows in our system
int cols, rows;

void setup() {
  size(640, 480);

  // Initialize columns and rows
  cols = width/videoScale;
  rows = height/videoScale;
}

void draw() {
 
grid();
cellAlive(5,5);

  
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

void Live(){
  
}
