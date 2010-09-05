//
//  VideoSample1ViewController.m
//  VideoSample1
//
//  Created by mmlemon on 10/09/06.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "VideoSample1ViewController.h"

@implementation VideoSample1ViewController

@synthesize uvc;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

-(void)toFullScreen
{
	
	if([[UIScreen screens] count] <= 1){
		return;
	}
	// ログとして外部モニターに表示する内容
	// log message displayed in external monitor.
	NSMutableString *str = [[NSMutableString alloc] init];
	int screenCount = [[UIScreen screens] count];
	
	// 設定されるスクリーンモード
	// used screen mode
	UIScreenMode *current = nil;
	
	// checking each screen information
	for(int i = 0; i < screenCount; i++)
	{
		int modelen = [[[[UIScreen screens] objectAtIndex:i] availableModes] count];
		
		// checking each screen mode in screen.
		for (int j = 0; j < modelen; j++) 
		{
			// getting screen mode
			UIScreenMode *curMode = [[[[UIScreen screens] objectAtIndex:i] availableModes] objectAtIndex:j];
			
			// get information of screen.
			NSString *sstr = [NSString stringWithFormat:@"screen:%i, mode:%i, w:%f, h:%f, ratio:%f ---", i, j, current.size.width, current.size.height, current.pixelAspectRatio];
			
			[str appendString:sstr];
			
			// if curMode.size.width is larger than current, change current reference
			if(curMode.size.width > current.size.width){
				current = curMode;
			}
		}
		
	}
	
	// screen object 
	UIScreen *another = [[UIScreen screens] objectAtIndex:1];
	another.currentMode = current;
	CGSize size = current.size;
	
	uvc = [[UIViewController alloc] init];
	
	// create new window.
	UIWindow *window = [[UIWindow alloc] initWithFrame:CGRectMake(
																  0.0f,
																  0.0f,
																  size.width,
																  size.height
						)];
	
	UITextView *tv = [[UITextView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 800.0f, 800.0f)];
	[uvc.view addSubview:tv];
	tv.text = str;
	
	[tv release];
	
	[window addSubview:uvc.view];
	window.screen = another;
	
	[window makeKeyAndVisible];
	[window setHidden:NO];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self toFullScreen];
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[uvc release];
    [super dealloc];
}

@end
