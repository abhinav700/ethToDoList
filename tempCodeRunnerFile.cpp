
int rec2(int m){
    return (!rec1(m));
}
int main(){
    printf("%d %d %d %d",rec1(0),rec1(1),rec2(1022),rec2(2001));
    return 0;
}