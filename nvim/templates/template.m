#import <Foundation/Foundation.h>

@interface MyObject: NSObject
-(void) method;
-(void) setmethod1: (int) n;
-(void) setmethod2: (int) d;
@end

@implementation MyObject
{
  int foo;
  int bar;
}

-(void) method
{

}

-(void) setmethod1: (int) n
{
  foo = n;
}

-(void) setmethod2: (int) d
{
  bar = d;
}

@end
int main (int argc, const char * argv [])
{
	@autoreleasepool {

	}
	return 0;
}
