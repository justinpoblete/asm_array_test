#include <iostream>
#include <array>


extern "C" int fillarray(unsigned long *myarray, long size){
  for(int i = 0; i < size; ++i){
    myarray[i] = i + 2;
  }
  return size;
}
