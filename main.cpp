#include <iostream>

extern "C" int call();

using namespace std;

int main(){
  int ret = 99;

  ret = call();
  cout << "main recieved: " << ret << endl;
  return 0;
}
