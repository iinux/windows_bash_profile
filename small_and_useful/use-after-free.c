// To compile: g++ -O -g -fsanitize=address use-after-free.c 
int main(int argc, char **argv) { 
    int *array = new int[10]; 
    delete [] array; 
    return array[argc];  // BOOM 
}
